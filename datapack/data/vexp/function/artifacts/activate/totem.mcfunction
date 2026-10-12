# Totem activate
# Tag player
tag @s add vexp.artifact_activate

# Effects
effect give @s slow_falling 15 3 true
effect give @s instant_health 3 8 true
effect give @s regeneration 15 2 true
effect give @s glowing 5 0 true
team join vexp.yellow

# Lava protection
execute if block ~ ~ ~ lava run setblock ~ ~ ~ water
execute if block ~ ~ ~ water run setblock ~ ~ ~ air

execute if block ~ ~ ~ lava run effect give @s fire_resistance 5 0 true

execute positioned ~ ~-1 ~ if block ~ ~ ~ lava run setblock ~ ~ ~ basalt

execute positioned ~ ~-1 ~1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~ ~-1 ~2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~ ~-1 ~-1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~ ~-1 ~-2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt

execute positioned ~1 ~-1 ~ if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~2 ~-1 ~ if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-1 ~-1 ~ if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-2 ~-1 ~ if block ~ ~ ~ lava run setblock ~ ~ ~ basalt

execute positioned ~1 ~-1 ~1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~1 ~-1 ~2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~1 ~-1 ~-1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~1 ~-1 ~-2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt

execute positioned ~2 ~-1 ~1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~2 ~-1 ~2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~2 ~-1 ~-1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~2 ~-1 ~-2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt

execute positioned ~-1 ~-1 ~1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-1 ~-1 ~2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-1 ~-1 ~-1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-1 ~-1 ~-2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt

execute positioned ~-2 ~-1 ~1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-2 ~-1 ~2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-2 ~-1 ~-1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-2 ~-1 ~-2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt

execute positioned ~ ~ ~1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~ ~ ~2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~ ~ ~-1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~ ~ ~-2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt

execute positioned ~1 ~ ~ if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~1 ~ ~1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~1 ~ ~2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~1 ~ ~-1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~1 ~ ~-2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt

execute positioned ~-1 ~ ~ if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-1 ~ ~1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-1 ~ ~2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-1 ~ ~-2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt

execute positioned ~2 ~ ~ if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~2 ~ ~1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~2 ~ ~2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~2 ~ ~-1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~2 ~ ~-2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-2 ~ ~ if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-2 ~ ~1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-2 ~ ~2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-2 ~ ~-1 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt
execute positioned ~-2 ~ ~-2 if block ~ ~ ~ lava run setblock ~ ~ ~ basalt

# Activation FX
function vexp:artifacts/fx/activation

# Item Spin Feedback
function vexp:artifacts/fx/item_spin

# Durability
execute if items entity @s weapon.offhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_offhand_durability
execute if items entity @s weapon.mainhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/damage_mainhand_durability

scoreboard players set @s vexp.totem_air_time 0
