# Waiting for special attack
# @s is the custom mob

execute if entity @e[tag=vexp.snitcher_illager_mom,distance=1.5..16,sort=nearest,limit=1] run particle instant_effect{color:4214878} ~ ~ ~ 0.1 0.1 0.1 0 1
