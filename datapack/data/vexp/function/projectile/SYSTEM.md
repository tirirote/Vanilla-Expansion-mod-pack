# Sistema Global de Proyectiles - NBT Unificado

## Configuración por NBT

Todo el sistema de proyectiles ahora utiliza un objeto NBT unificado `data.proj` que contiene todos los parámetros necesarios. Esto elimina la duplicación de scoreboards y simplifica el mantenimiento.

## Estructura NBT

Cada proyectil debe tener una estructura `data.proj` con los siguientes campos:

```json
{
  "data": {
    "proj_type": "nome_del_tipo",
    "proj": {
      "speed": 0.8,
      "lifetime": 18,
      "gravity": 0,
      "damage": 6
    }
  }
}
```

### Parámetros

| Parámetro | Tipo | Rango | Descripción |
|-----------|------|-------|-------------|
| `speed` | Decimal | 0.1-2.0 | Distancia en bloques por tick (ej: 0.8 = 0.8 bloques/tick) |
| `lifetime` | Entero | 1-100+ | Duración en ticks antes de despawnear |
| `gravity` | Entero | 0-20 | Rotación de pitch por tick (0=sin gravedad, 5=gravedad suave, 10=gravedad fuerte) |
| `damage` | Entero | 0-20 | Daño base infligido al impactar |

## Ejemplo: Crear un Nuovo Proyectil

### 1. Spawn del Proyectil

```mcfunction
# En tu_arma/on_right_click.mcfunction
tag @s add vexp.projectile_owner
execute rotated as @s run summon marker ^ ^1 ^1 {Tags:["vexp.projectile","vexp.tu_arma_projectile","vexp.temp_projectile"],data:{proj_type:"tu_arma"}}
execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:projectile/spawn
```

### 2. Hook on_spawn.mcfunction

```mcfunction
# dungeons/tu_arma/projectile/on_spawn.mcfunction
# Configurar todos los parámetros en un único NBT
data modify entity @s data.proj set value {speed:0.8, lifetime:15, gravity:2, damage:4}
```

### 3. Otros Hooks (on_tick, on_hit_mob, etc.)

Los parámetros se pasan automáticamente via macro. Para acceder a ellos:

```mcfunction
# En hooks que reciben @s data via macro
# Ejemplo: on_hit_mob.mcfunction
execute as @e[tag=vexp.proj_target,limit=1] run damage @s $(proj.damage) minecraft:magic
```

## Flujo de Ejecución

```
summon marker (con data.proj_type)
  ↓
vexp:projectile/spawn
  ├─ Llama: on_spawn with entity @s data
  │   └─ Establece data.proj {speed, lifetime, gravity, damage}
  ↓
vexp:projectile/tick (cada tick)
  ├─ Reduce lifetime: data.proj.lifetime -= 1
  ├─ Llama: on_tick with entity @s data
  ├─ Llama: move with entity @s data
  │   └─ Macro: $tp @s ^ ^ ^$(proj.speed) ~ ~$(proj.gravity)
  ├─ Llama: check_collision → on_hit_mob/on_hit_block
  └─ Si lifetime <= 0: despawn
```

## Comparativo: Antes vs Después

### Antes (Scoreboards + Macro)
```mcfunction
scoreboard players set @s vexp.proj_speed 8
scoreboard players set @s vexp.proj_lifetime 18
scoreboard players set @s vexp.proj_gravity 0
data modify entity @s data.speed_dist set value 0.8
data modify entity @s data.gravity_rot set value 0

# Macro con parámetros duplicados
$tp @s ^ ^ ^$(speed_dist) ~ ~$(gravity_rot)
```

### Después (NBT Unificado)
```mcfunction
data modify entity @s data.proj set value {speed:0.8, lifetime:18, gravity:0, damage:6}

# Macro limpia
$tp @s ^ ^ ^$(proj.speed) ~ ~$(proj.gravity)
```

## Ventajas del Sistema Unificado

✅ **Sin scoreboards duplicados** - Todo en NBT  
✅ **Parámetros centralizados** - Todo en `data.proj`  
✅ **Fácil de escalar** - Agregar nuevos parámetros en el objeto  
✅ **Legible** - Estructura clara y semántica  
✅ **Macros simples** - Acceso directo a `proj.speed`, `proj.gravity`, etc.  

## Ejemplos de Parámetros Comunes

**Proyectil rápido sin gravedad (flecha):**
```json
{speed:1.5, lifetime:20, gravity:0, damage:5}
```

**Proyectil lento con gravedad (bola de fuego):**
```json
{speed:0.6, lifetime:30, gravity:3, damage:8}
```

**Proyectil muy rápido con gravedad fuerte (meteorito):**
```json
{speed:2.0, lifetime:15, gravity:15, damage:10}
```

## NBT Completo de Ejemplo

**Guadaña:**
```json
{
  "Tags": ["vexp.projectile", "vexp.scythe_projectile"],
  "data": {
    "proj_type": "scythe",
    "proj": {
      "speed": 0.8,
      "lifetime": 18,
      "gravity": 0,
      "damage": 6
    }
  }
}
```

**Daga (con tags de material):**
```json
{
  "Tags": ["vexp.projectile", "vexp.dagger_projectile", "vexp.iron"],
  "data": {
    "proj_type": "dagger",
    "proj": {
      "speed": 0.9,
      "lifetime": 10,
      "gravity": 5,
      "damage": 4
    }
  }
}
```

## Tipos de Movimiento Especial: Tornado (Órbita)

Si el proyectil incluye un objeto `tornado` dentro de `data.proj`, el sistema utilizará movimiento orbital alrededor del dueño en lugar de movimiento lineal. El proyectil se vinculará automáticamente al `vexp.id` del jugador que lo invocó.

### Estructura NBT para Tornados

```json
{
  "data": {
    "proj_type": "ejemplo_tornado",
    "proj": {
      "lifetime": 50,
      "damage": 2,
      "tornado": {
        "radius": 1.2,
        "speed": 7.5,
        "height": 1.1,
        "cw": 1b
      }
    }
  }
}
```

### Parámetros del Tornado

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `radius` | Decimal | Radio de la órbita. Un valor negativo lo posiciona en el lado opuesto. |
| `speed` | Decimal | Velocidad de rotación en grados por tick. |
| `height` | Decimal | Altura relativa a los pies del dueño. |
| `cw` | Booleano | Sentido de giro. `1b`: Horario (Clockwise), `0b`: Antihorario (Counter-Clockwise). |

### Dinámicas en Tiempo Real

Puedes modificar los parámetros del tornado (como el radio para que crezca) en el hook `on_tick` de tu proyectil. El sistema de movimiento leerá los valores actualizados en cada tick.

### Ejemplo de Spawn de Tornado Doble

```mcfunction
# En on_right_click.mcfunction
tag @s add vexp.projectile_owner
# Tornado A (Derecha)
summon marker ^ ^ ^ {Tags:["vexp.projectile","vexp.temp_projectile"],data:{proj_type:"mi_tornado",proj:{tornado:{radius:1.2,speed:7.5,height:1.1,cw:1b}}}}
# Tornado B (Izquierda)
summon marker ^ ^ ^ {Tags:["vexp.projectile","vexp.temp_projectile"],data:{proj_type:"mi_tornado",proj:{tornado:{radius:-1.2,speed:7.5,height:1.1,cw:1b}}}}
execute as @e[tag=vexp.temp_projectile] at @s run function vexp:projectile/spawn
```
