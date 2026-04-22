# Custom Projectile System

Ruta principal: datapack/data/vexp/function/projectile

## Que resuelve

Sistema modular para crear y mover projectiles mediante hooks, esto hace la creación de projectiles nuevos mucho más sencilla.

## Flujo general

1. Crea un `armor_stand` marker con `vexp.temp_projectile` y `data.proj_type`.
2. `projectile/spawn` vincula owner, inicializa defaults y ejecuta hook on_spawn.
3. `projectile/tick` ejecuta move, colision y hooks de impacto.
4. `projectile/despawn` cierra ciclo y limpia estado.

## Hooks por tipo

Ruta: projectile/projectiles/`proj_type`/

Hooks comunes para todos los projectiles:

- `on_spawn.mcfunction`
- `on_tick.mcfunction`
- `on_hit_mob.mcfunction`
- `on_hit_block.mcfunction`
- `on_despawn.mcfunction`

## Crear un proyectil nuevo

### 1) Definir el spawn del projectil

Este patrón de spawn es el patrón por defecto para spawnear uno o varios projectiles, de esta forma evitamos dependencias fragiles entre proyectiles del mismo volley.

```mcfunction
# @s = player
#Tag obligatoria para el jugador (sin ella el projectil no rota correctamente)
tag @s add vexp.projectile_owner

#Modificación del storage donde se guarda la info temporal de spawn del proyectil
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.my_projectile",proj_type:"my_projectile",proj_data:{}}

#Spawnea el projectil base con la configuración temporal
execute positioned ^ ^ ^1 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

#Spawn del proyectil con la configuración definitiva, ID y rotación correcta
execute as @e[type=minecraft:armor_stand,tag=vexp.my_projectile,tag=vexp.temp_projectile,sort=nearest,limit=1,distance=..4] at @s run function vexp:projectile/spawn
```

### 2) Configuración del projectil

La configuración del projectil es definida en el hook `on_spawn`

```mcfunction
# projectile/projectiles/my_projectile/on_spawn.mcfunction
data modify entity @s data.proj set value {
  speed:0.30,
  lifetime:40,
  gravity:0,
  damage:4,
  randomness:0.1,
  homing_distance:12,
  exclude_tag:"nether_marked"
}
```

#### Parámetros esperados en el payload de data.proj

- `speed*`: velocidad lineal del projectil (recomendado: 0.3 - 0.8).
- `lifetime*`: vida del projectil medida en ticks del juego.
- `gravity`: "gravedad" simulada (aplicando rotación en el `tp`).
- `damage*`: daño infligido por el projectil (en int).
- `randomness`: movimiento errático del projectil (recomendado: 0.05 - 0.3).
- `spin`: rotación progresiva del projectil.
- `face_player`: projectil fijado a la mirada del jugador.
- `radius`: radio de orbitación del projectil.
- `orbit_height`: altura de órbita del projectil.
- `homing_distance`: distancia de "enfocado" o "homming" hacia una entidad objetivo.
- `exclude_tag`: tag para excluir un objetivo del homming.

Los parámetros con \* son obligatorios.

**Combinaciones más usadas**

- Un proyectil con alto `randomness` y baja `speed` creará un projectil estilo "nube de insectos" o "boid"
- Los parámetros `face_player`, `radius` van en conjunto para crear un projectil que sigue al jugador en un radio custom.
- Los parámetros `spin`, `radius` y `orbit_height` crean un proyectil estilo tornado.
