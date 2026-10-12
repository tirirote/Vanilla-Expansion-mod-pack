# On special attack feedback hook
# @s is the custom mob

# Summons his mom if he does not have one
execute unless entity @e[tag=vexp.snitcher_illager_mom,distance=1.5..16,sort=nearest,limit=1] run function vexp:custom_mobs/mobs/snitcher/summon_illager_mom

particle instant_effect{color:4943479,power:-1} ~ ~ ~ 1 0.1 1 1 5

function vexp:utils/sound {sound: "minecraft:entity.vindicator.celebrate", type: "player", pitch:2}
