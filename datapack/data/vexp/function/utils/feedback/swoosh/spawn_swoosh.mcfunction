# utils/feedback/swoosh/spawn_trail.mcfunction
# @s is the player
# Params: $(item_id), $(model)
# One simple trail per frame with age 0 - maximum temporal resolution.

$execute as @p[tag=vexp.attacker,limit=1] at @s positioned ^ ^ ^2 run function vexp:utils/feedback/swoosh/spawn {item_id:"minecraft:firework_rocket",model:"$(model)"}
