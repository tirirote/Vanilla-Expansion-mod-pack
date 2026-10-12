# Ring activate
tag @s add vexp.artifact_activate

# Effects
# Disarm mob
execute as @e[tag=vexp.ring_target] if items entity @s weapon.mainhand * at @s run function vexp:artifacts/activate/ring/disarm

# Activation FX
function vexp:artifacts/fx/activation

# Item Spin Feedback
function vexp:artifacts/fx/item_spin

# Durability
execute if items entity @s weapon.offhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_offhand_durability
execute if items entity @s weapon.mainhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_mainhand_durability

scoreboard players set @s vexp.ring_mob_count 0
