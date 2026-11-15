# Redstone Interactions
# @s is the proj

# Lever
execute if block ~ ~ ~ minecraft:lever run function vexp:projectile/utils/redstone/lever

# Buttons
execute if block ~ ~ ~ #minecraft:buttons run function vexp:projectile/utils/redstone/buttons

# Presure plates
function vexp:projectile/utils/redstone/pressure_plates

# Doors
execute if block ~ ~ ~ #minecraft:doors run function vexp:projectile/utils/redstone/doors

# Trapdoors
execute if block ~ ~ ~ #minecraft:trapdoors run function vexp:projectile/utils/redstone/trapdoors

# Fence Gates
execute if block ~ ~ ~ #minecraft:fence_gates run function vexp:projectile/utils/redstone/fence_gates

# Target block
execute if block ~ ~ ~ minecraft:target[power=0] run setblock ~ ~ ~ minecraft:target[power=1]
execute if block ~ ~ ~ minecraft:target[power=1] run setblock ~ ~ ~ minecraft:target[power=0]
