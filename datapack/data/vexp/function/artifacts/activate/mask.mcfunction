# Mask activate
tag @s add vexp.artifact_activate

# Effects
execute as @e[tag=vexp.mask_friend,distance=..16,sort=nearest,limit=3] run damage @s 0.1 generic by @e[type=#vexp:hostile,tag=!vexp.mask_friend,limit=1,sort=nearest,distance=..16]

# Activation FX
function vexp:artifacts/fx/activation

# Item Spin Feedback
function vexp:artifacts/fx/item_spin

# Durability
execute if items entity @s weapon.offhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_offhand_durability
execute if items entity @s weapon.mainhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_mainhand_durability

team join vexp.mask_friends
scoreboard players set @s vexp.mask_mob_count 4
