# Sistema Global de Proyectiles - Macros Dinámicas

## Arquitectura

El sistema usa **macros dinámicas** para ejecutar funciones específicas de cada tipo de proyectil sin llenar los hooks con múltiples líneas condicionales.

### Tag Principal
- `vexp.projectile` - Tag base para todos los proyectiles

### NBT del Proyectil
Cada proyectil debe tener un campo `data.proj_type` que identifica su tipo:
```mcfunction
{data:{proj_type:"scythe"}}
```

### Scoreboards del Sistema
- `vexp.proj_lifetime` - Tiempo de vida en ticks
- `vexp.proj_speed` - Velocidad en décimas (8 = 0.8 bloques/tick)
- `vexp.proj_gravity` - Si aplica gravedad (0 o 1)
- `vexp.proj_damage` - Daño base

## Sistema de Hooks con Macros

Todos los hooks son macros que reciben `$(proj_type)` y ejecutan dinámicamente:
```mcfunction
$function vexp:dungeons/$(proj_type)/projectile/on_[hook]
```

### Hooks Disponibles
- `on_spawn` - Configuración inicial
- `on_tick` - Efectos visuales cada tick
- `on_hit_mob` - Al golpear entidad
- `on_hit_block` - Al golpear bloque
- `on_despawn` - Limpieza final

## Cómo Crear un Nuevo Proyectil

### 1. Estructura de Carpetas
```
vexp/function/dungeons/tu_arma/projectile/
  ├── on_spawn.mcfunction
  ├── on_tick.mcfunction
  ├── on_hit_mob.mcfunction
  ├── on_hit_block.mcfunction
  └── on_despawn.mcfunction
```

### 2. Spawnear con NBT del Tipo
```mcfunction
# En tu_arma/on_right_click.mcfunction
tag @s add vexp.projectile_owner
execute rotated as @s run summon marker ^ ^1 ^1 {Tags:["vexp.projectile","vexp.tu_arma_projectile","vexp.temp_projectile"],data:{proj_type:"tu_arma"}}
execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:projectile/spawn
```

**IMPORTANTE:** El valor `proj_type:"tu_arma"` debe coincidir con el nombre de la carpeta en `dungeons/`.

### 3. Implementar los Hooks

**on_spawn.mcfunction** - Configura los scoreboards:
```mcfunction
scoreboard players set @s vexp.proj_speed 8
scoreboard players set @s vexp.proj_lifetime 20
scoreboard players set @s vexp.proj_gravity 0
scoreboard players set @s vexp.proj_damage 5
```

**on_tick.mcfunction** - Efectos visuales:
```mcfunction
particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 2
```

**on_hit_mob.mcfunction** - Daño y efectos:
```mcfunction
# @e[tag=vexp.proj_target] es el mob objetivo
execute as @e[tag=vexp.proj_target,limit=1] run damage @s 5 minecraft:magic
particle minecraft:explosion ~ ~ ~ 0.2 0.2 0.2 0.05 1
```

**on_hit_block.mcfunction** - Efecto al chocar:
```mcfunction
particle minecraft:cloud ^ ^ ^0.35 0.2 0.2 0.2 0.02 5
function vexp:utils/sound {sound: "minecraft:item.trident.hit_ground", type: "player"}
```

**on_despawn.mcfunction** - Limpieza (opcional):
```mcfunction
# Dejar vacío si no necesitas lógica especial
```

## Ejemplo Completo: Proyectil de Guadaña

**Spawn:**
```mcfunction
summon marker ^ ^1.2 ^0.8 {Tags:["vexp.projectile","vexp.scythe_projectile","vexp.temp_projectile"],data:{proj_type:"scythe"}}
```

**Estructura:**
```
dungeons/scythe/projectile/
  ├── on_spawn.mcfunction   # speed:8, lifetime:18, gravity:0, damage:6
  ├── on_tick.mcfunction    # Partículas gust + squid_ink
  ├── on_hit_mob.mcfunction # Daño 6 + slowness
  ├── on_hit_block.mcfunction # Partículas cloud
  └── on_despawn.mcfunction  # Vacío
```

## Ventajas del Sistema de Macros

✅ **Sin código repetitivo** - Un solo hook ejecuta todas las variantes  
✅ **Fácil extensión** - Agregar nuevo proyectil = crear 5 archivos  
✅ **Sin modificar código base** - Nunca editas los hooks globales  
✅ **Nomenclatura clara** - `proj_type` debe coincidir con nombre de carpeta  
✅ **Mantenimiento simple** - Lógica aislada por tipo de proyectil

## Migración desde Sistema de Tags

**Antes (múltiples líneas):**
```mcfunction
execute if entity @s[tag=vexp.scythe_projectile] run function vexp:dungeons/scythe/projectile/on_tick
execute if entity @s[tag=vexp.bow_projectile] run function vexp:dungeons/bow/projectile/on_tick
execute if entity @s[tag=vexp.staff_projectile] run function vexp:dungeons/staff/projectile/on_tick
```

**Ahora (una macro):**
```mcfunction
$function vexp:dungeons/$(proj_type)/projectile/on_tick
```
