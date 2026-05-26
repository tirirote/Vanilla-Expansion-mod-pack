# Update storage with THIS player's item info to avoid race conditions
data modify storage vexp:dungeons.weapon combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
data modify storage vexp:dungeons.weapon combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item
data modify storage vexp:dungeons.weapon combo_params.type set from entity @s SelectedItem.components."minecraft:custom_data".vexp.type
data modify storage vexp:dungeons.weapon combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.quality

# 1. Counter-damage: deal weapon damage to the entity that attacked the player
tag @s add vexp.parry_counter_attacker
execute store result storage vexp:temp parry_counter.damage int 0.1 run scoreboard players get @s vexp.damage_taken
execute if entity @e[tag=vexp.parried,limit=1] run function vexp:dungeons/combo_system/hooks/parry/parry_counter_damage with storage vexp:temp parry_counter
tag @s remove vexp.parry_counter_attacker

function vexp:dungeons/combo_system/hooks/parry/route_on_parry with storage vexp:dungeons.weapon combo_params
#Parry feedback
execute positioned ~ ~1.5 ~ run particle dust_plume ^ ^ ^2 0.2 0.2 0.2 0.1 5
execute positioned ~ ~1.5 ~ run particle sweep_attack ^ ^ ^2 0.0 0.0 0.0 0 0

function vexp:utils/sound {sound: "minecraft:entity.experience_orb.pickup", type: "player"}
