# On swoosh custom hook
execute if score @s vexp.hit_delay matches 4 run function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player", pitch:1}

# Spell particles
execute if score @s vexp.hit_delay matches 4..5 positioned ^ ^ ^1.5 run function vexp:dungeons/fx/spell/gold
execute if score @s vexp.hit_delay matches 3..4 positioned ^ ^ ^3 run function vexp:dungeons/fx/spell/gold
execute if score @s vexp.hit_delay matches 2..3 positioned ^ ^ ^4.5 run function vexp:dungeons/fx/spell/gold
execute if score @s vexp.hit_delay matches 1..2 positioned ^ ^ ^6 run function vexp:dungeons/fx/spell/gold
execute if score @s vexp.hit_delay matches ..1 positioned ^ ^ ^7.5 run function vexp:dungeons/fx/spell/gold
