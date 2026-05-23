# add_book.mcfunction
# Se ejecuta AS la interaction de la pila de libros.

# Limite maximo de libros representables por modelo (0..7).
execute store result score #temp vexp.math run data get entity @s data.vexp.book_count
execute if score #temp vexp.math matches 7.. run return fail

# Copiar item del jugador y forzar count=1 para almacenar una unidad exacta.
data remove storage vexp:custom_block pile_books_held
data modify storage vexp:custom_block pile_books_held set from entity @a[tag=vexp.pile_books_user,limit=1] SelectedItem
execute unless data storage vexp:custom_block pile_books_held run return fail
data modify storage vexp:custom_block pile_books_held.count set value 1

# Persistir libro completo en la lista del bloque.
data modify entity @s data.vexp.books append from storage vexp:custom_block pile_books_held

# Consumir 1 item de la mano del jugador.
item modify entity @a[tag=vexp.pile_books_user,limit=1] weapon.mainhand {"function":"minecraft:set_count","count":-1,"add":true}

# Incrementar contador y actualizar modelo.
scoreboard players add #temp vexp.math 1
execute store result entity @s data.vexp.book_count int 1 run scoreboard players get #temp vexp.math
function vexp:custom_block/blocks/pile_of_books/update_display_model

# Feedback de insercion.
function vexp:custom_block/macro/sound {sound:"minecraft:entity.item.pickup"}
