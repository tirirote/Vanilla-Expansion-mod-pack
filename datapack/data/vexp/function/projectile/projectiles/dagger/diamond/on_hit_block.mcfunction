# On hit block custom hook
# @s is the dagger

#Buff
execute as @p[tag=vexp.dagger_owner,limit=1] run function vexp:dungeons/states/diamond_buffed

#Feedback
function vexp:dungeons/fx/aeo_waves/diamond
