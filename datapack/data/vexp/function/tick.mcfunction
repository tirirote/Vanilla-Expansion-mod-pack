# Main tick loop
function vexp:custom_block/tick

#Dungeons
function vexp:dungeons/tick

# Custom projectile system
execute as @e[type=minecraft:armor_stand,tag=vexp.projectile] at @s run function vexp:projectile/tick

#Pirotecnics
function vexp:tnt_stick/tick

# Main loop is now dungeon-routed; legacy handgun tick call was removed.
#Misc
function vexp:mob_health/tick
function vexp:utils/feedback/dust_wave_tick

#States
function vexp:utils/states/tick

#Player
function vexp:player/feedback
function vexp:feedback/tick

#Movement
#function vexp:movement/tick

function vexp:utils/feedback/tick

#Custom mobs
function vexp:custom_mobs/tick

# Custom combat states
function vexp:dungeons/states/tick

# TAG CLEANUP (End of tick)
tag @e[tag=vexp.hit_candidate] remove vexp.hit_candidate
tag @a[tag=vexp.attacker] remove vexp.attacker
tag @e[tag=vexp.hitted] remove vexp.hitted
tag @e[tag=vexp.parried] remove vexp.parried
