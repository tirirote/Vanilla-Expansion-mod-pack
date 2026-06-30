# On special attack feedback hook
# @s is the custom mob

execute if block ^ ^ ^-0.5 #replaceable run tp @s ^ ^ ^-0.5 facing entity @p[limit=1] eyes

execute positioned ~ ~0.5 ~ run particle snowflake ^ ^ ^1 0.2 0.2 0.2 0.1 10
execute positioned ~ ~0.5 ~ run particle snowflake ^ ^ ^2 0.5 0.5 0.5 0.02 7
execute positioned ~ ~0.5 ~ run particle snowflake ^ ^ ^3 0.35 0.35 0.35 0.02 5
execute positioned ~ ~0.5 ~ run particle snowflake ^ ^ ^4 0.15 0.15 0.15 0.02 5
execute positioned ~ ~0.5 ~ run particle snowflake ^ ^ ^5 0.1 0.1 0.1 0.02 3
execute positioned ~ ~0.5 ~ run particle snowflake ^ ^ ^6 0 0 0 0.02 1

execute positioned ~ ~0.5 ~ run particle instant_effect{color:10348799} ^ ^ ^1 0.1 0.1 0.1 0.02 1
execute positioned ~ ~0.5 ~ run particle instant_effect{color:10348799} ^ ^ ^2 0.1 0.1 0.1 0.02 1
execute positioned ~ ~0.5 ~ run particle instant_effect{color:10348799} ^ ^ ^3 0.1 0.1 0.1 0.02 1
execute positioned ~ ~0.5 ~ run particle instant_effect{color:10348799} ^ ^ ^4 0.1 0.1 0.1 0.02 1
execute positioned ~ ~0.5 ~ run particle instant_effect{color:10348799} ^ ^ ^5 0.1 0.1 0.1 0.02 1
execute positioned ~ ~0.5 ~ run particle instant_effect{color:10348799} ^ ^ ^6 0.1 0.1 0.1 0.02 1

execute positioned ^ ^ ^6 unless block ~ ~-1 ~ #snow unless block ~ ~-1 ~ #air if block ~ ~ ~ #replaceable run setblock ~ ~ ~ snow

function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.powder_snow.break", type: "player"}
