# Scarab activate
tag @s add vexp.artifact_activate

effect give @s luck 1 255 true

# Effects
execute as @e[type=item,distance=..6,tag=vexp.scarab_count] unless data entity @s Thrower unless entity @s[tag=vexp.scarab_duplicate] unless entity @s[tag=vexp.scarab_duplicate_loot] at @s run function vexp:artifacts/activate/scarab/item_duplicate with entity @s

# Activation FX
function vexp:artifacts/fx/activation

# Item Spin Feedback
function vexp:artifacts/fx/item_spin

# Durability
execute if items entity @s weapon.offhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_offhand_durability
execute if items entity @s weapon.mainhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_mainhand_durability

scoreboard players set @s vexp.scarab_item_count 0
