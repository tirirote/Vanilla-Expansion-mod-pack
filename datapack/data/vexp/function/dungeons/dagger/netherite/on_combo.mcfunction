# @s is the player, @e[tag=vexp.hitted] is the mob

function vexp:utils/motion/apply_knockback {strength:1.5, y:0.1}

#Dash
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.125 ~ if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^-1 ^1

effect give @p[tag=vexp.attacker,limit=1] minecraft:speed 1 0 true

particle minecraft:lava ~ ~1 ~ .2 .2 .2 0 3
particle flame ~ ~1 ~ .2 .2 .2 0.05 3
particle large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.1 3

function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
