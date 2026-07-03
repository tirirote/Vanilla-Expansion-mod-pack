# Bloques personalizados

El sistema de bloques personalizados está estructurado de forma modular, mediante hooks (la forma más óptima y escalable). El bloque base es un `minecraft:item_frame`, al ser una entidad colocable, es la forma más viable para crear bloques personalizados

En `custom_block` tenemos el sistema estructurado de la siguiente forma:

- `tick`: Función principal de tick.
- `process_placement`: Ejecutada desde `tick`, gestiona el instante inicial al colocar el bloque.
- `on_tick`: Wrapper para el hook `on_tick` para cada bloque.
- `on_interact`: Wrapper para el hook `on_interact` para cada bloque.
- `on_attack`: Wrapper para el hook `on_attack` para cada bloque
- `jitter`: Función de feedback complementaria.
- `break`: Wrapper y finalizador al romper el bloque desde `on_attack`.

> [!INFO] Funcionalidad
>
> Este sistema permite crear bloques personalizados, tantos como queramos dentro de `custom_block/blocks/`, siempre que al crear la carpeta incluyamos la siguientes funciones:
>
>- `on_tick`: Hook principal que se ejecuta cada tick.
>- `on_attack`: Hook que se dispara cuando el jugador hace [click izquierdo] sobre el bloque.
>- `on_interact`: Hook que se dispara cuando el jugador hace [click derecho] sobre el bloque.


### [Bloques Implementados](/docs/blocks.md)


## Estructura de datos

El sistema lee los datos del bloque personalizado con `data get entity @s data.vexp` dentro de `data.vexp` el sistema espera la siguiente estructura de datos:

```json
{
  id:1,
  type:"tipo",
  name:"Nombre",
  model:"modelo_3d",
  width:1.0d,
  height:1.0d,
  s_place:"sonido al colocal",
  s_break:"sonido al romper",
  p_break:"partículas al romper"
}
```

Nota: los modelos 3d que se implementen deben de estar referenciados dentro de `assets/minecraft/items/item_frame.json`, ya que utilizamos `minecraft:item_frame` como bloque inicial.


## ¿Cómo creo un bloque nuevo con este sistema?

A la hora de crear un bloque nuevo, tendremos en cuenta los siguientes pasos:

1. Crear logica en la ruta `custom_block/blocks/<type>/`, siendo `<type>` el parámentro de `data.vexp.type`:
2. Implementar las funciones obligatorias `on_interact`, `on_attack`, y `on_tick`.
3. Probar en el juego.

4. Iterar hasta conseguir el resultado esperado.


> [!INFO] Notas de diseño a la hora de crear un bloque nuevo
>
> A la hora de crear un bloque nuevo, este es recomendable que siga los principios de diseño del bloque base:
>
> 1. Estética **Medieval** / **Rústica**.
> 2. Funcionalidad **clara y definida**.
> 3. Posible integración con otros sistemas (por ejemplo, redstone).
>
> Es importante remarcar que puedes crear lo que tu quieras, la magia de Minecraft es que no hay límites a la hora crear cosas nuevas, pero pongamos un ejemplo de diseño:
>
> Si por ejemplo quieres que Steve craftee por ejemplo un **Ordenador de Sobremesa**, digamos que a lo mejor dentro de la estética base del juego, a lo mejor tiene más sentido implementar una **"Radio rudimentaria"**.
> Esta **Radio rudimentaria** puede "Sintonizar" o "Filtrar" diferentes sonidos ayudando al jugador a por ejemplo localizar animales o evitar puntos hostiles como los pillager outposts.
>
> A su vez conviene tener en cuenta si tu bloque personalizado va a pisar una funcionalidad existente dentro del juego, o si se aleja mucho de la experiencia que buscas, todo es cuestión de probar.
>

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
