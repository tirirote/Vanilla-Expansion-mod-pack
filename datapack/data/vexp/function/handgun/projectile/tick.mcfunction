#1. Comprobamos si el proyectil ha tocado algo un bloque sólido
execute unless block ^ ^ ^1 #minecraft:replaceable run function vexp:handgun/projectile/hit

#2. Comprobamos si el proyectil ha tocado un mob
execute if entity @e[type=!player,type=!item_display,type=!interaction,type=!marker,distance=..1.5,limit=1] run function vexp:handgun/projectile/hit_mob

#3. Restamos vida al proyectil
scoreboard players remove @s vexp.bullet_life 1
execute if score @s vexp.bullet_life matches ..0 run kill @s

#4. movemos el proyectil
tp @s ^ ^ ^1

#Debug
execute as @s run particle dust_plume ~ ~ ~ .1 .1 .1 0.01 1
execute as @s run particle smoke ~ ~ ~ 0 0 0 0.05 1
