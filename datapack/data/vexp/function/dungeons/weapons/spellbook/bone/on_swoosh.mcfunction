# On swoosh custom hook
execute if score @s vexp.hit_delay matches 5 run function vexp:utils/sound {sound: "minecraft:entity.evoker.cast_spell", type: "player", pitch:1}

# Spell particles
execute if score @s vexp.hit_delay matches 5 positioned ^ ^ ^2 run function vexp:dungeons/fx/spell/bone
execute if score @s vexp.hit_delay matches 5 positioned ^ ^ ^3 run function vexp:dungeons/fx/spell/bone

execute if score @s vexp.hit_delay matches 4 positioned ^ ^ ^4 run function vexp:dungeons/fx/spell/bone
execute if score @s vexp.hit_delay matches 4 positioned ^ ^ ^5 run function vexp:dungeons/fx/spell/bone

execute if score @s vexp.hit_delay matches 3 positioned ^ ^ ^6 run function vexp:dungeons/fx/spell/bone
execute if score @s vexp.hit_delay matches 3 positioned ^ ^ ^6.5 run function vexp:dungeons/fx/spell/bone

execute if score @s vexp.hit_delay matches 2 positioned ^ ^ ^7 run function vexp:dungeons/fx/spell/bone
execute if score @s vexp.hit_delay matches 2 positioned ^ ^ ^7.5 run function vexp:dungeons/fx/spell/bone

execute if score @s vexp.hit_delay matches 1 positioned ^ ^ ^8 run function vexp:dungeons/fx/spell/bone
execute if score @s vexp.hit_delay matches 1 positioned ^ ^ ^8.5 run function vexp:dungeons/fx/spell/bone
