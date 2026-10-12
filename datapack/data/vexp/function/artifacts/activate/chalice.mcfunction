# Chalice activate
tag @s add vexp.artifact_activate

# Effects
effect clear @s slowness
effect clear @s wither
effect clear @s poison
effect clear @s blindness
effect clear @s darkness
effect clear @s infested
effect clear @s oozing
effect clear @s weaving
effect clear @s weakness

effect give @s regeneration 15 0 true
effect give @s strength 15 0 true
effect give @s absorption 15 0 true

# Activation FX
function vexp:artifacts/fx/activation

# Item Spin Feedback
function vexp:artifacts/fx/item_spin

# Durability
execute if items entity @s weapon.offhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_offhand_durability
execute if items entity @s weapon.mainhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_mainhand_durability
