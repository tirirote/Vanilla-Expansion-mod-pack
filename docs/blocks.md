# Bloques Implementados

Dentro de `custom_block/blocks/` están todos los bloques definidos según su `<type>`.

Actualmente tengo implementado los siguientes bloques personalizados:

## Candelabro

Definido en `custom_block/blocks/candle_holder/`

Soporte para velas decorativo.

### Receta

<div align=center>
<img alt="recipe" src="/docs/images/candle_holder_recipe.png"/>
</div>

### Funcionamiento

- Al hacer [click derecho] con 1 vela: colocas la vela en el candelabro.
- Al hacer [click derecho] con un mechero si hay una vela: enciendes la vela.
Ofreciendo un nivel de luz ligeramente superrior de luz (`4` en vez de `3`).

---

## Silla

Definido en `custom_block/blocks/chair/`

Permite sentar al jugador o a un mob (disponible en todas las variantes de madera).

### Receta

<div align=center>
<img alt="recipe" src="/docs/images/chair_recipe.png"/>
</div>

### Funcionamiento

- Al hacer [click derecho]: Te puedes sentarte tu mismo.
- Al hacer [click derecho] soteniendo un mob con una rienda: sientas al mob.

---

## Caja

Definido en `custom_block/blocks/crate/`

Permite almacenar hasta hasta `9` items distintos.

### Receta

<div align=center>
<img alt="recipe" src="/docs/images/crate_recipe.png"/>
</div>

### Funcionamiento

- Al hacer [click derecho] con un item en la mano: Añades el item a la caja.
- Al hacer [click derecho] con la mano vacía: Retiras todos los items de la caja.

---

## Tabla de cortar

Definido en `custom_block/blocks/cutting_board/`

*Este bloque es parte de la temática de [Cocina](/docs/cooking.md)*

Permite cortar items de la categoría de "comestible" o "ingredientes".

### Receta

<div align=center>
<img alt="recipe" src="/docs/images/cutting_table_recipe.png"/>
</div>

### Funcionamiento

- Al hacer [click derecho] con un item en la mano: Añades el item
a la tabla de cortar.
- Al hacer [click derecho] con cualquier espada, cortas el item,
  obteniendo un nuevo item comestible.

---

## Puertas

Definido en `custom_block/blocks/door/`

Rework a la puertas originales, ahora estas se abrirán con una animación suave.

---

## Sartén

Definido en `custom_block/blocks/frying_pan/`

*Este bloque es parte de la temática de [Cocina](/docs/cooking.md)*

Una sartén rudimentaria para cocinar items de la categoría de "comestible" o "ingredientes".

### Receta

<div align=center>
<img alt="recipe" src="/docs/images/frying_pan_recipe.png"/>
</div>

### Funcionamiento

- Al hacer [click derecho] con un item en la mano: Añades el item a la sartén.
- Si la sartén está colocada encima de un bloque que emita calor,
  podrá cocinar el item colocado.

---

## Jarra

Definido en `custom_block/blocks/jar/`

Almacena tintes y otros polvos, pudiendo contener hasta `64` del mismo tipo.

## Receta

<div align=center>
<img alt="recipe" src="/docs/images/jar_recipe.png"/>
</div>

## Funcionamiento

- Al hacer [click derecho] con un item en la mano: Añades un item a la jarra.
- Al hacer [click derecho] con la mano vacía: Retiras todos los items almacenados.

---

## Pila del libros

Definido en `custom_block/blocks/pile_of_books/`

Una pila de libros, puedes apilar un extra de hasta `7` libros.

### Receta

<div align=center>
<img alt="recipe" src="/docs/images/pile_of_books.png"/>
</div>

### Funcionamiento

- Al hacer [click derecho] con un libro en la mano: Añades el libro a la pila.
- Al hacer [click derecho] con la mano vacía: Quitas el último libro de la pila

---

## Muñeco de Entrenamiento

Definido en `custom_block/blocks/training_dummy/`

*Este bloque es parte de la temática de [Dungeons](/docs/dungeons.md)*

Permite practicar combate de una forma sencilla.

### Receta

<div align=center>
<img alt="recipe" src="/docs/images/training_dummy_recipe.png"/>
</div>

### Funcionamiento

- Al golpear con un arma: Puedes practicar fácilmente con tu arma.

---

## Candados y Llaves

Definido en `custom_block/blocks/lock/`

Permite cerrar cofres, barriles, shulkers y puertas.

### Receta

<div align=center>
<img alt="recipe" src="/docs/images/lock_recipe.png"/>
</div>

<div align=center>
<img alt="recipe" src="/docs/images/key_recipe.png"/>
</div>

### Funcionamiento

- Debe de ser colocado sobre el cofre o la puerta.
- Debes de renombrar una llave antes de usarla.
- Al hacer [click derecho] con una "llave" con un nombre personalizado: Bloqueas el bloque, siendo solo desbloqueable con esa misma llave.
- Al bloquear un bloque con una llave, sólo podrás abrirlo con esa llave
