# On special attack feedback hook
# @s is the custom mob

# Summons his mom if he does not have one
execute unless entity @e[tag=vexp.snitcher_illager_mom,distance=1.5..16,sort=nearest,limit=1] run function vexp:custom_mobs/mobs/snitcher/summon_illager_mom

particle instant_effect{color:4943479,power:-1} ~ ~ ~ 1 0.1 1 1 5
execute positioned ~ ~ ~ run function vexp:utils/feedback/dust_particle {initialColor:[0.3,0.5,0.4],finalColor:[0.4,0.6,0.6],scale:1.7,dX:1,dY:0.1,dZ:1,speed:1,count:3}

function vexp:utils/sound {sound: "minecraft:entity.vindicator.celebrate", type: "player", pitch:2}
