# Summon dynamic light
execute unless entity @s[tag=vexp.glow_light] run function vexp:dungeons/states/glow_light
execute if block ~ ~ ~ #air run setblock ~ ~ ~ light[level=9]
