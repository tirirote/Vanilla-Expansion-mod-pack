# Fire Aspect: prende fuego al objetivo.

execute if score @s vexp.enchant.fire_aspect matches 1 as @e[tag=vexp.hitted] run data merge entity @s {Fire:80s}
execute if score @s vexp.enchant.fire_aspect matches 2.. as @e[tag=vexp.hitted] run data merge entity @s {Fire:160s}

#Fire Aspect FX
execute as @e[tag=vexp.hitted] at @s run function vexp:dungeons/fx/enchantments/fire
