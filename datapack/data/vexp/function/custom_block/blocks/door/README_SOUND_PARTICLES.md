# Referencia: Personalizar Sonidos y Partículas de Puertas

## Cómo Funciona el Sistema Dinámico

Los sonidos y partículas ahora se leen **dinámicamente desde el NBT** de la entidad de interacción, en lugar de estar hardcodeados.

### Campos de NBT Soportados

Cuando creas una puerta con el comando parametrizado, estos campos se almacenan:

```
data.vexp.{
  s_place: "minecraft:sound.id",    // Sonido al colocar bloque
  s_break: "minecraft:sound.id",    // Sonido al romper bloque
  s_open: "minecraft:sound.id",     // Sonido al abrir puerta
  s_close: "minecraft:sound.id",    // Sonido al cerrar puerta
  wood_type: "oak|birch|...",       // Tipo de madera (para partículas)
  // ... otros campos como model, item_model, etc.
}
```

### Cuándo Se Leen Los Sonidos

1. **Al abrir puerta** → lee `s_open` → `open.mcfunction`
2. **Al cerrar puerta** → lee `s_close` → `close.mcfunction`
3. **Al romper puerta** → lee `s_break` + `wood_type` → `on_break.mcfunction`

### Flujo de Interacción: Detalle Técnico

#### open.mcfunction:

```mcfunction
data modify storage vexp:temp play_sound set from entity @s data.vexp.s_open
function vexp:custom_block/blocks/door/play_nbt_sound
→ llama a play_nbt_sound_macro.mcfunction con el valor interpolado
```

#### play_nbt_sound_macro.mcfunction:

```mcfunction
$function vexp:custom_block/macro/sound {sound:"$(play_sound)"}
```

Lo mismo aplica para `close.mcfunction` (pero usa `s_close`) y `on_break.mcfunction` (usa `s_break`).

### Reproducir Partículas

En `on_break.mcfunction`, se ejecuta:

```mcfunction
data modify storage vexp:temp wood_type set from entity @s data.vexp.wood_type
function vexp:custom_block/blocks/door/play_nbt_particles
```

Que interpola el `wood_type` en `play_nbt_particles_macro.mcfunction`:

```mcfunction
$particle block{block_state:{Name:'minecraft:$(wood_type)_planks'}} ~ ~ ~ 0.2 0.2 0.2 0.5 10
```

## Crear Puertas Personalizadas

### Opción 1: Usar Comando Parametrizado Directamente

```mcfunction
function vexp:custom_block/blocks/door/give_parametered {wood_type:"oak",wood_name:"Roble",model:"vexp:door_block_oak",item_model:"vexp:door_oak",s_place:"minecraft:block.wood.place",s_break:"minecraft:block.wood.break",s_open:"minecraft:block.wooden_door.open",s_close:"minecraft:block.wooden_door.close"}
```

### Opción 2: Crear Nuevo Give Command

Si quieres una puerta con sonidos diferentes, crea `datapack/data/vexp/function/custom_block/blocks/door/give_custom_name.mcfunction`:

```mcfunction
# give_custom_name.mcfunction
# Da una puerta personalizada

function vexp:custom_block/blocks/door/give_parametered {
  wood_type:"birch",
  wood_name:"Puerta Especial",
  model:"vexp:door_block_birch",
  item_model:"vexp:door_birch",
  s_place:"minecraft:block.wood.place",
  s_break:"minecraft:block.wood.break",
  s_open:"minecraft:block.wooden_door.open",
  s_close:"minecraft:block.wooden_door.close"
}
```

### Opción 3: Sonidos Personalizados

Para usar sonidos personalizados, cambia los valores de `s_place|s_break|s_open|s_close`:

```mcfunction
function vexp:custom_block/blocks/door/give_parametered {
  wood_type:"oak",
  wood_name:"Puerta de Metal",
  model:"vexp:door_block_custom",
  item_model:"vexp:door_custom",
  s_place:"minecraft:block.metal.place",      // ← Sonido personalizado
  s_break:"minecraft:block.metal.break",      // ← Sonido personalizado
  s_open:"minecraft:block.iron_door.open",    // ← Sonido personalizado
  s_close:"minecraft:block.iron_door.close"   // ← Sonido personalizado
}
```

## Sonidos Disponibles en Vanilla

### Puertas

- `minecraft:block.wooden_door.open`
- `minecraft:block.wooden_door.close`
- `minecraft:block.iron_door.open`
- `minecraft:block.iron_door.close`

### Madera

- `minecraft:block.wood.place`
- `minecraft:block.wood.break`
- `minecraft:block.wood.step`
- `minecraft:block.wood.hit`

### Otros

- `minecraft:block.stone.break`
- `minecraft:block.metal.place`
- etc.

## Archivos Clave del Sistema

| Archivo                               | Propósito                          |
| ------------------------------------- | ---------------------------------- |
| `give_parametered.mcfunction`         | Comando base parametrizado         |
| `give_*.mcfunction`                   | Versiones preconfiguradas por tipo |
| `play_nbt_sound.mcfunction`           | Lee sonido desde storage           |
| `play_nbt_sound_macro.mcfunction`     | Macro que interpola sonido         |
| `play_nbt_particles.mcfunction`       | Lee wood_type y genera partículas  |
| `play_nbt_particles_macro.mcfunction` | Macro que genera block particles   |

## Debugging

Si los sonidos/partículas no reproducen:

1. Verifica que la entidad de interacción tenga los campos correcto en NBT
2. Checa el storage con: `/data get storage vexp:temp`
3. Confirma que la función macro existe en el path esperado
4. Verifica permisos de sonido en cliente
