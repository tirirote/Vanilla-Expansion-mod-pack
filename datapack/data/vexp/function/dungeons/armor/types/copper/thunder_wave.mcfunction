# Thunder area wave
tag @s add vexp.copper_armor_thunder

# Cache owner ID for self-filter in target queries.
scoreboard players operation #combo_owner_id vexp.id = @s vexp.id

# Area Damage
execute as @e[predicate=vexp:is_target,distance=..4.5] unless score @s vexp.id = #combo_owner_id vexp.id at @s run function vexp:utils/deal_damage {damage:1, type:"magic", by:"@p[tag=vexp.copper_armor_thunder,limit=1]"}

# FX
particle electric_spark ~ ~1 ~ 1 0.2 1 0.2 15
particle instant_effect{color:12051967,power:2} ~ ~1 ~ 0.5 0.2 0.5 1 5
particle flash{color:-4986369} ~ ~1 ~ 1 1 1 1 0

function vexp:utils/sound {sound: "minecraft:block.respawn_anchor.deplete", type: "player", pitch:2}
function vexp:utils/sound {sound: "minecraft:block.trial_spawner.spawn_item", type: "player", pitch:2}

tag @s remove vexp.copper_armor_thunder
