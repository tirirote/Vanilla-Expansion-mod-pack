# dungeons/states/catch_release.mcfunction
# @s is the caught mob to be released
# Cleans up catch tags and timer

tag @s remove vexp.state.catched
tag @p[tag=vexp.catch.owner,limit=1] remove vexp.catch.owner

#Feedback
particle cloud ~ ~ ~ 0.2 0.0 0.2 0.1 3
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}

team leave @s
