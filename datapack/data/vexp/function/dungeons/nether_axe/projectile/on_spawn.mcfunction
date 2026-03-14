# dungeons/axe_nether/projectile/on_spawn.mcfunction
# @s is the projectile

# 120 ticks total lifetime; return phase starts at 60 ticks (3s)
data modify entity @s data.proj set value {speed:0.6, lifetime:40, gravity:0, damage:1, randomness:0.06, homing_distance:0.0}

# Spawn visual axe model (same idea as dagger projectile display)
summon item_display ~ ~ ~ {Tags:["vexp.axe_display","vexp.temp_display"],item:{id:"minecraft:netherite_axe"},transformation:{translation:[0f,0f,0f],scale:[0.95f,0.95f,0.95f],left_rotation:[1f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]},item_display:"none",teleport_duration:1,interpolation_duration:1}

# Clear temporary tag from freshly spawned display
tag @e[tag=vexp.temp_display,sort=nearest,limit=1,distance=..1.5] remove vexp.temp_display

function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}

