# on_break.mcfunction
# Soltar la pila base (3 libros) y luego todos los libros almacenados.

# Pila base: 3 libros separados.
summon item ~ ~0.5 ~ {Tags:["vexp.pile_books_base_drop"],Item:{id:"minecraft:book",count:1}}
execute as @e[type=item,tag=vexp.pile_books_base_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
tag @e[type=item,tag=vexp.pile_books_base_drop,sort=nearest,limit=1,distance=..1] remove vexp.pile_books_base_drop

summon item ~ ~0.5 ~ {Tags:["vexp.pile_books_base_drop"],Item:{id:"minecraft:book",count:1}}
execute as @e[type=item,tag=vexp.pile_books_base_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
tag @e[type=item,tag=vexp.pile_books_base_drop,sort=nearest,limit=1,distance=..1] remove vexp.pile_books_base_drop

summon item ~ ~0.5 ~ {Tags:["vexp.pile_books_base_drop"],Item:{id:"minecraft:book",count:1}}
execute as @e[type=item,tag=vexp.pile_books_base_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
tag @e[type=item,tag=vexp.pile_books_base_drop,sort=nearest,limit=1,distance=..1] remove vexp.pile_books_base_drop

# Libros almacenados (máx 7 por diseño): soltar cada entrada completa con su NBT.
execute if data entity @s data.vexp.books[0] run summon item ~ ~0.5 ~ {Tags:["vexp.pile_books_book_drop"],Item:{id:"minecraft:book",count:1}}
execute if data entity @s data.vexp.books[0] run data modify entity @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] Item set from entity @s data.vexp.books[0]
execute if data entity @s data.vexp.books[0] as @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
execute if data entity @s data.vexp.books[0] run tag @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] remove vexp.pile_books_book_drop

execute if data entity @s data.vexp.books[1] run summon item ~ ~0.5 ~ {Tags:["vexp.pile_books_book_drop"],Item:{id:"minecraft:book",count:1}}
execute if data entity @s data.vexp.books[1] run data modify entity @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] Item set from entity @s data.vexp.books[1]
execute if data entity @s data.vexp.books[1] as @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
execute if data entity @s data.vexp.books[1] run tag @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] remove vexp.pile_books_book_drop

execute if data entity @s data.vexp.books[2] run summon item ~ ~0.5 ~ {Tags:["vexp.pile_books_book_drop"],Item:{id:"minecraft:book",count:1}}
execute if data entity @s data.vexp.books[2] run data modify entity @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] Item set from entity @s data.vexp.books[2]
execute if data entity @s data.vexp.books[2] as @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
execute if data entity @s data.vexp.books[2] run tag @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] remove vexp.pile_books_book_drop

execute if data entity @s data.vexp.books[3] run summon item ~ ~0.5 ~ {Tags:["vexp.pile_books_book_drop"],Item:{id:"minecraft:book",count:1}}
execute if data entity @s data.vexp.books[3] run data modify entity @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] Item set from entity @s data.vexp.books[3]
execute if data entity @s data.vexp.books[3] as @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
execute if data entity @s data.vexp.books[3] run tag @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] remove vexp.pile_books_book_drop

execute if data entity @s data.vexp.books[4] run summon item ~ ~0.5 ~ {Tags:["vexp.pile_books_book_drop"],Item:{id:"minecraft:book",count:1}}
execute if data entity @s data.vexp.books[4] run data modify entity @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] Item set from entity @s data.vexp.books[4]
execute if data entity @s data.vexp.books[4] as @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
execute if data entity @s data.vexp.books[4] run tag @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] remove vexp.pile_books_book_drop

execute if data entity @s data.vexp.books[5] run summon item ~ ~0.5 ~ {Tags:["vexp.pile_books_book_drop"],Item:{id:"minecraft:book",count:1}}
execute if data entity @s data.vexp.books[5] run data modify entity @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] Item set from entity @s data.vexp.books[5]
execute if data entity @s data.vexp.books[5] as @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
execute if data entity @s data.vexp.books[5] run tag @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] remove vexp.pile_books_book_drop

execute if data entity @s data.vexp.books[6] run summon item ~ ~0.5 ~ {Tags:["vexp.pile_books_book_drop"],Item:{id:"minecraft:book",count:1}}
execute if data entity @s data.vexp.books[6] run data modify entity @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] Item set from entity @s data.vexp.books[6]
execute if data entity @s data.vexp.books[6] as @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
execute if data entity @s data.vexp.books[6] run tag @e[type=item,tag=vexp.pile_books_book_drop,sort=nearest,limit=1,distance=..1] remove vexp.pile_books_book_drop
