# init_state.mcfunction
# Se ejecuta AS la interaction de la pila de libros.

execute unless data entity @s data.vexp.book_count run data modify entity @s data.vexp.book_count set value 0
execute unless data entity @s data.vexp.books run data modify entity @s data.vexp.books set value []

function vexp:custom_block/blocks/pile_of_books/update_display_model
