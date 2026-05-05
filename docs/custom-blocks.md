# Custom Block System

`datapack/data/vexp/function/custom_block`

## Que resuelve

*Permite bloques funcionales usando item_frame + interaction + NBT, manteniendo estilo vanilla.*

> [!INFO] Funcionamiento
>
> 1. Un item_frame con tag vexp.custom_block.place entra al sistema.
> 2. custom_block/process_placement extrae data.vexp al storage temporal.
> 3. custom_block/macro/spawn crea la entidad interaction del bloque.
> 4. custom_block/tick procesa clic derecho, clic izquierdo y on_tick por tipo.

**Entry points**

- `custom_block/tick`: orquesta placement, interact, attack y tick por bloque.
- `custom_block/process_placement`: valida facing y datos, luego hace spawn.
- `custom_block/on_interact.mcfunction`: dispatcher por tipo usando macro.
- `custom_block/on_attack.mcfunction` logica de rotura.
- `custom_block/break.mcfunction` drop y limpieza final.

## Estructura de datos esperada

*El item_frame de colocacion debe tener NBT en data.vexp:*

```json
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

*Nota: para obtener los datos NBT del item dentro del juego, puedes ejecutar:*
`/data get entity @s SelectedItem.components`

## Ejemplo de extension: nuevo tipo de bloque

1. Crear logica en la ruta: `custom_block/blocks/<tipo>/`
2. Implementar como minimo:
   - `on_interact`
   - `on_attack`
   - `on_tick` (opcional)

3. Probar en el juego.

---

## Bloques nuevos añadidos

### Sillas

Silla crafteable, está disponible en todos los tipos de madera actuales del juego.

**Receta**

<img title= "Receta de Silla" atl= "Receta de Silla" src="/docs/images/chair-recipe.png" width="100%"/>

*Nota: Esta receta en mi opinión es muy intutiva, barata y sencilla, de todas formas si hay sugerencias, abrid una Issue y lo tendré en cuenta.*

**Renderizado dentro del juego**
<p align="center">
  <img title= "Silla vacía" atl= "Silla vacía" src="/docs/images/chair.png" width="45%"/>
  <img title= "Silla con cerdito" atl= "Silla con cerdito" src="/docs/images/chair-w-mob.png" width="45%"/>
</p>

> #
>
> **Funcionalidad**
>
> - El jugador pude sentarse con click derecho.
> - Mientras sujetas un mob sujetado con una rienda (leash) puede sentarlo haciendo click derecho en la silla.
>
> #


### Crates

Cajas crafteables para cualquier variante de madera.

**Receta**

<img title= "Receta de Silla" atl= "Receta de Silla" src="/docs/images/crate-recipe.png" width="512px"/>

**Renderizado dentro del juego**
<p align="center">
  <img title= "Crate" atl= "Crate" src="/docs/images/crate.png" width="49%"/>
  <img title= "Crate full" atl= "Crate" src="/docs/images/crate-full.png" width="49%"/>
</p>

> #
>
> **Funcionalidad**
>
> - Almacena hasta 9 items diferentes.
> - Suelta todos los items al hacer click derecho con la mano vacía.
>
> #

---

### Muñeco de entrenamiento

El muñeco de entrenamiento está directamente inspirado de Minecraft Dungeons.

<img title= "Muñeco de entrenamiento" atl= "Muñeco de entrenamiento" src="/docs/images/training-dummy.png" width="100%"/>

_Muñeco de entrenamiento_

> #
>
> **Funcionalidad**
>
> - Al ser golpeado el muñeco se balancea ligeramente y muestra el daño infligido.
>
> #

---

## Notas practicas

- process_placement exige Facing:1b para placement valido en suelo.
- Si falta data valida, se dropea item y se elimina frame.
- Mantener limpieza de tags para evitar interacciones fantasma.
