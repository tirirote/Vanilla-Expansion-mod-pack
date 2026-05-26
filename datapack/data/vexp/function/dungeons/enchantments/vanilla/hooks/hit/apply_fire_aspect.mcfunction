# Fire Aspect: prende fuego al objetivo.

execute if score #ench_fire vexp.math matches 1 as @e[tag=vexp.hitted] run data merge entity @s {Fire:80s}
execute if score #ench_fire vexp.math matches 2.. as @e[tag=vexp.hitted] run data merge entity @s {Fire:160s}
