# Custom Block System

Ruta principal: datapack/data/vexp/function/custom_block

## Que resuelve

Permite bloques funcionales usando item_frame + interaction + NBT, manteniendo estilo vanilla.

## Flujo general

1. Un item_frame con tag vexp.custom_block.place entra al sistema.
2. custom_block/process_placement extrae data.vexp al storage temporal.
3. custom_block/macro/spawn crea la entidad interaction del bloque.
4. custom_block/tick procesa clic derecho, clic izquierdo y on_tick por tipo.

## Entry points

- custom_block/tick.mcfunction: orquesta placement, interact, attack y tick por bloque.
- custom_block/process_placement.mcfunction: valida Facing y datos, y hace spawn.
- custom_block/on_interact.mcfunction: dispatcher por tipo usando macro.
- custom_block/on_attack.mcfunction: logica de rotura.
- custom_block/break.mcfunction: drop y limpieza final.

## Estructura de datos esperada

El item_frame de colocacion debe tener NBT en data.vexp (ejemplo):

```mcfunction
{data:{vexp:{
  id:1,
  type:"chair",
  name:"Oak Chair",
  model:"vexp:block/chair_oak",
  width:1.0d,
  height:1.0d,
  s_place:"minecraft:block.wood.place",
  s_break:"minecraft:block.wood.break",
  p_break:"block"
}}}
```

## Ejemplo de extension: nuevo tipo de bloque

1. Crear logica en custom_block/blocks/<tipo>/
2. Implementar como minimo:

```text
on_interact.mcfunction
on_attack.mcfunction
on_tick.mcfunction (opcional)
```

3. Asegurar que el dispatcher macro reconozca type:<tipo>.
4. Probar placement (suelo), interaccion y rotura.

## Notas practicas

- process_placement exige Facing:1b para placement valido en suelo.
- Si falta data valida, se dropea item y se elimina frame.
- Mantener limpieza de tags para evitar interacciones fantasma.
