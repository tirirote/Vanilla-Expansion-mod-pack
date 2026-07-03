# Bloques Implementados

Dentro de `custom_block/blocks/` están todos los bloques definidos, muchos bloques que tengan variantes de colores de madera o similares, comparten el mismo tipo y lógica base, únicamente cambia el modelo.

Actualmente tengo implementado los siguientes bloques personalizados:

## Candelabro `candle_holder/`

Candelabro decorativo.

### Receta

### Funcionamiento

- Al hacer [click derecho]: Puedes colocar sólo 1 vela (`minecraft:candle`) de cualquier color dentro del candelabro, y puedes encender la vela con un mechero (`minecraft:flint_and_steel`). Una vela encendida en un candelabro proporciona un nivel de luz ligeramente superrior de luz (`4` en vez de `3`).

## Silla `chair/`

Silla funcional (disponible en todas las variantes de madera).

### Receta

### Funcionamiento

- Al hacer [click derecho]: Te puedes sentar tu mismo o sentar a un mob si este tiene una rienda (`minecraft:lead`).

## Caja `crate/`

Una caja de madera (disponible en todas las variantes de madera) que puede almacenar hasta `9` items distintos.

### Receta

### Funcionamiento

- Al hacer [click derecho] con un item en la mano: Añades ese item a la caja, hasta llegar al límite de 9.
- Al hacer [click derecho] con la mano vacía: Retiras todos los items de la caja.

## Tabla de cortar `cutting_board/`

*Este bloque es parte de la expansión de [Cocina](/docs/cooking.md)*

Una tabla para cortar en la que puedes cortar una serie de items de la categoría de "comida".

### Receta

### Funcionamiento

- Al hacer [click derecho] con un item en la mano: Añades el item a la tabla de cortar.
- Al hacer [click derecho] con cualquier espada (`#minecraft:swords`), cortas el item, obteniendo uno o varios items.

## Puertas `door/`

Rework a la puertas originales, ahora al interactuar con las puertas, estas se abrirán con una animación suave.

- Al hacer [click derecho]

Sartén `frying_pan`

Jarra `jar/`

Pila del libros `pile_of_books`

Muñeco de Entrenamiento `training_dummy`

Estatua de Glifo `vanguarder_statue`
