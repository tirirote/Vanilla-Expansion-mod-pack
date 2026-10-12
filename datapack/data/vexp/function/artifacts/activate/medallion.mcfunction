# Medallion activate
tag @s add vexp.artifact_activate
# Dedicated owner tag: vexp.artifact_activate is shared by every artifact, so it can
# match the wrong nearby player if two artifacts trigger the same tick.
tag @s add vexp.medallion_owner

# Cache owner ID for self-filter in target queries.
scoreboard players operation #medallion_owner vexp.id = @s vexp.id

# Effects
execute as @e[predicate=vexp:is_target,distance=..4.5,sort=nearest] unless score @s vexp.id = #medallion_owner vexp.id at @s run function vexp:utils/deal_damage {damage: 2,type:"magic",by:"@p[tag=vexp.medallion_owner,limit=1]"}
execute as @e[predicate=vexp:is_target,distance=..4.5,sort=nearest] unless score @s vexp.id = #medallion_owner vexp.id at @s run function vexp:utils/motion/apply_knockback {strength:-2.0, y:0.3}

effect give @s strength 15 2 true
effect give @s haste 15 2 true
effect give @s speed 15 1 true
effect give @s instant_health 1 2 true

# Activation FX
function vexp:artifacts/fx/activation

# Item Spin Feedback
function vexp:artifacts/fx/item_spin

# Durability
execute if items entity @s weapon.offhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_offhand_durability
execute if items entity @s weapon.mainhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_mainhand_durability

tag @s remove vexp.medallion_owner
scoreboard players set @s vexp.medallion_mob_count 0
