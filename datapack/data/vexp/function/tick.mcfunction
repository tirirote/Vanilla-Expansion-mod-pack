# Main tick loop
function vexp:custom_block/tick

#Dungeons
function vexp:dungeons/tick

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
