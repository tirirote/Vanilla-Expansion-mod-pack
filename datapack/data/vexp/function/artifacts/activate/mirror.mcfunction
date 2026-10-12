# Mirror activate
tag @s add vexp.artifact_activate

# Effects
effect give @s invisibility 30 0 true
effect give @s speed 15 0 true

execute as @e[predicate=vexp:is_target,type=!player,tag=vexp.mirror_mob_marked,distance=..6] run data remove entity @s angry_at
execute as @e[predicate=vexp:is_target,type=!player,tag=vexp.mirror_mob_marked,distance=..6] run data remove entity @s anger_end_time
execute as @e[predicate=vexp:is_target,type=!player,tag=vexp.mirror_mob_marked,distance=..6] run data remove entity @s anger
execute as @e[predicate=vexp:is_target,type=!player,tag=vexp.mirror_mob_marked,distance=..6] run data remove entity @s Anger

# Spawn copy
function vexp:artifacts/activate/mirror/spawn_copy with entity @s

# Activation FX
function vexp:artifacts/fx/activation

# Item Spin Feedback
function vexp:artifacts/fx/item_spin

# Durability
execute if items entity @s weapon.offhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_offhand_durability
execute if items entity @s weapon.mainhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_mainhand_durability

scoreboard players set @s vexp.mirror_mob_count 0
