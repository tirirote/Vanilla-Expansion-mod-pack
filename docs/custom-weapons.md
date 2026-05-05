# Custom Weapons and Hooks

Ruta principal: datapack/data/vexp/function/dungeons

## Modelo de arma

Cada arma define comportamiento en hooks base y opcionalmente por calidad.

Ejemplo estructura (scythe):

```text
dungeons/scythe/
  on_hit.mcfunction
  on_combo.mcfunction
  on_right_click.mcfunction
  netherite/on_hit.mcfunction
  netherite/on_combo.mcfunction
  netherite/on_right_click.mcfunction
  echo/...
  diamond/...
  gold/...
  give.mcfunction
  give_macro.mcfunction
```

## Hooks principales por arma

- on_hit: reaccion por golpe individual.
- on_combo: efecto al cerrar combo.
- on_right_click: habilidad activa.
- on_parry: solo para armas que lo usan (por router).

## Ejemplo real de hook base

```mcfunction
# dungeons/scythe/on_hit.mcfunction
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}
execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_sword_hit
```

## Ejemplo real de right click con proyectil

```mcfunction
# dungeons/scythe/on_right_click.mcfunction
tag @s add vexp.projectile_owner
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.scythe_projectile",proj_type:"common_scythe",proj_data:{}}
execute rotated as @s positioned ^ ^ ^0.8 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[type=minecraft:armor_stand,tag=vexp.scythe_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn
```

## Relacion con custom_data del item

Los routers leen estos campos desde SelectedItem.components.minecraft:custom_data.vexp:

- item: familia (sword, scythe, dagger, etc).
- type: short_combo | mid_combo | long_combo.
- combo.quality: normal | netherite | echo | diamond | gold.
- combo.cooldown y combo.right_click_cooldown.

## Checklist para crear arma nueva

1. Crear recetas con custom_data consistente.
2. Implementar hooks base en dungeons/<arma>/.
3. Implementar variantes por calidad si aplica.
4. Crear give y give_macro alineados con recetas.
5. Probar:
   - on_hit
   - combo finisher
   - right click cooldown
   - parry (si aplica)

## Armas nuevas añadidas

Muchas armas nuevas están directamente inspiradas de minecraft dungeons, no están todas añadidas, ya que hay muchas armas que ofrecen una experiencia de juego muy parecida. Para que esté balanceado, tienen un daño de ataque bajo, y un área de daño reducido.

### Dagas

Las dagas infligen poco daño en un área reducida, en contraste con eso tienen un tiempo de cooldown bajo ofreciendo un combate ligero a corta distancia.

**Receta**

<img title= "Receta de Daga" atl= "Receta de Daga" src="/docs/images/dagger-recipe.png" width="100%"/>

**Renderizado en el juego**

**Combate**

<img title= "Daga en combate" atl= "Daga en combate" src="/docs/gifs/dagger-attack.gif" width="100%"/>

**Habiidad**

<img title= "Daga click derecho" atl= "Daga click derecho" src="/docs/gifs/dagger-right-click.gif" width="100%"/>

Puedes arrojar la daga con click derecho, infligiendo el mismo daño que un golpe normal.

---

### Guantes

Los guantes proporcionan un estilo de combate cuerpo a cuerpo y frenético debido a su cooldown muy bajo. Para que esté balanceado, tienen un daño de ataque bajo, y un área de daño reducido.

**Receta**

<img title= "Receta de Guantes" atl= "Receta de Guantes" src="/docs/images/gauntlets-recipe.png" width="100%"/>

**Combate**

<img title= "Guantes en combate" atl= "Guantes en combate" src="/docs/gifs/gauntlet-attack.gif" width="100%"/>

**Habiidad**

<p align=center>
<img title= "Habilidad de Guantes" atl= "Habilidad de Guantes" src="/docs/gifs/gauntlets-rigth-click.gif" width="49%"/>
<img title= "Habilidad de Guantes" atl= "Habilidad de Guantes" src="/docs/gifs/gauntlets-rigth-click-villager.gif" width="49%"/>
</p>

### Estoques

Los estoques permiten atacar desde lejos gracias a su gran alcance de 6 bloques, a su vez ofrecen una rápida velocidad de ataque, para que esté balanceado, tienen un daño de ataque bajo y un área de daño reducido.

**Receta**

<img title= "Receta de Estoque" atl= "Receta de Estoque" src="/docs/images/rapier-recipe.png" width="100%"/>

**Combate**

<img title= "Estoque en Combate" atl= "Estoque en Combate" src="/docs/gifs/rapier-attack.gif" width="100%"/>

**Habiidad**

<img title= "Habilidad de estoque" atl= "Habilidad de estoque" src="/docs/gifs/rapier-right-click.gif" width="100%"/>

### Guadañas

Las guadañas ofrecen un estilo de combate lento pero poderoso, infligiendo una gran cantidad de daño en un rango muy amplio, para balancearlo, tiene un tiempo de cooldown muy largo.

**Receta**

<img title= "Receta de Guadaña" atl= "Receta de Guadaña" src="/docs/images/scythe-recipe.png" width="100%"/>

**Combate**

<img title= "Guadaña en combate" atl= "Estoque en Combate" src="/docs/gifs/scythe-attack.gif" width="100%"/>

**Habilidad**

<img title= "Habilidad de guadaña" atl= "Habilidad de guadaña" src="/docs/gifs/scythe-right-click.gif" width="100%"/>

### Espadas

Las espadas no han sufrido muchos cambios en este sistema de combate, únicamente la partícula de "sweep_attack" ya no aparece. En cambio ahora las espadas tienen más un poco más de rango de ataque y realizan más daño en área.

**Receta**

<img title= "Receta de Estoque" atl= "Receta de Estoque" src="/docs/images/sword-recipe.png" width="100%"/>

### Hachas

Las hachas ofrecen un estilo de combate muy parecido al combate vanilla, infligiendo mucho daño en un área reducida, y con un tiempo de cooldown ligeramente menor a las espadas.

**Receta**

<img title= "Receta de Estoque" atl= "Receta de Estoque" src="/docs/images/axe-recipe.png" width="100%"/>

### Arcos

Los arcos son de las armas vanilla que más cambios a sufrido, antes de nada ahora hay variantes de arco por calidad (no solo un arco de madera). Y ofrecen un estilo de combate a distancia más dinámico, además de ofrecer un combo corto.

**Receta**
<p align=center>
<img title= "Receta de Estoque" atl= "Receta de Estoque" src="/docs/images/bow-recipe.png" width="49%"/>
<img title= "Receta de Estoque" atl= "Receta de Estoque" src="/docs/images/bow-recipe1.png" width="49%"/>
<p>

## Recomendaciones

- Mantener nombres de familia simples y estables (se usan en routers).
- Evitar logica duplicada entre calidades; extraer helpers en utils cuando se repita.
- Si cambias quality model, auditar routers y wrappers.
