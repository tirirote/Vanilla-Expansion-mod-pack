# update_display_model.mcfunction
# Se ejecuta AS la interaction de la pila de libros.

execute unless data entity @s data.vexp.book_count run data modify entity @s data.vexp.book_count set value 0

# Clamp 0..7 para que siempre exista modelo valido.
execute store result score #pile_books_state vexp.math run data get entity @s data.vexp.book_count
execute if score #pile_books_state vexp.math matches ..-1 run scoreboard players set #pile_books_state vexp.math 0
execute if score #pile_books_state vexp.math matches 8.. run scoreboard players set #pile_books_state vexp.math 7
execute store result entity @s data.vexp.book_count int 1 run scoreboard players get #pile_books_state vexp.math

# Preparar estado para macro de string dinamico.
scoreboard players operation #pile_books_id vexp.id = @s vexp.id
data remove storage vexp:custom_block pile_books_model
execute store result storage vexp:custom_block pile_books_model.state int 1 run scoreboard players get #pile_books_state vexp.math

function vexp:custom_block/blocks/pile_of_books/update_display_model_macro with storage vexp:custom_block pile_books_model
