# on_interact.mcfunction
# Se ejecuta AS la interaction de la pila de libros.

# Identificar al jugador que interactua.
tag @a[tag=vexp.pile_books_user] remove vexp.pile_books_user
execute on target run tag @s add vexp.pile_books_user

# Compatibilidad con bloques legacy sin estado inicial.
execute unless data entity @s data.vexp.book_count run data modify entity @s data.vexp.book_count set value 0
execute unless data entity @s data.vexp.books run data modify entity @s data.vexp.books set value []

# Mano vacia: retirar un libro si hay contenido.
execute if data entity @a[tag=vexp.pile_books_user,limit=1] {} unless data entity @a[tag=vexp.pile_books_user,limit=1] SelectedItem if data entity @s data.vexp.book_count run function vexp:custom_block/blocks/pile_of_books/remove_book

# Mano con libro (book o written_book): insertar uno si hay espacio.
execute if items entity @a[tag=vexp.pile_books_user,limit=1] weapon.mainhand #vexp:pile_of_books_insertable if data entity @a[tag=vexp.pile_books_user,limit=1] SelectedItem run function vexp:custom_block/blocks/pile_of_books/add_book

# Limpieza.
tag @a[tag=vexp.pile_books_user] remove vexp.pile_books_user
