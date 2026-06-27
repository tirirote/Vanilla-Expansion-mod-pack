# remove_book.mcfunction
# Se ejecuta AS la interaction de la pila de libros.

execute store result score #temp vexp.math run data get entity @s data.vexp.book_count
execute if score #temp vexp.math matches ..0 run function vexp:custom_block/macro/sound {sound:"minecraft:item.book.put"}
execute if score #temp vexp.math matches ..0 run return fail
execute unless data entity @s data.vexp.books[-1] run return fail

# Spawnear item y copiar NBT completo del ultimo libro guardado.
summon item ~ ~0.5 ~ {Tags:["vexp.pile_books_drop"],Item:{id:"minecraft:book",count:1}}
data modify entity @e[type=item,tag=vexp.pile_books_drop,sort=nearest,limit=1,distance=..1] Item set from entity @s data.vexp.books[-1]
execute as @e[type=item,tag=vexp.pile_books_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
tag @e[type=item,tag=vexp.pile_books_drop,sort=nearest,limit=1,distance=..1] remove vexp.pile_books_drop

# Remover libro de la lista y decrementar contador.
data remove entity @s data.vexp.books[-1]
scoreboard players remove #temp vexp.math 1
execute store result entity @s data.vexp.book_count int 1 run scoreboard players get #temp vexp.math

# Sincronizar modelo visual.
function vexp:custom_block/blocks/pile_of_books/update_display_model

# Feedback de retiro.
function vexp:custom_block/macro/sound {sound:"minecraft:block.chiseled_bookshelf.pickup"}

