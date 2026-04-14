# dungeons/bow/arrows/hooks/detect_hit_mob.mcfunction
# @s is a bow probe marker linked to an arrow via vexp.id.
# Resolves hit even if arrow despawns on the collision tick.

# Expire probe if no hit after a few ticks.
scoreboard players remove @s vexp.timer 1
execute if score @s vexp.timer matches ..0 run kill @s

# Reset temp value.
scoreboard players set #bow_hurt_time vexp.math 0

# Read HurtTime from nearest valid target around probe position.
execute store result score #bow_hurt_time vexp.math run data get entity @e[predicate=vexp:is_target,distance=..1.5,sort=nearest,limit=1] HurtTime

# If a target was recently hurt, process mob-hit hook once for this probe.
execute if score #bow_hurt_time vexp.math matches 1.. run function vexp:dungeons/bow/arrows/hooks/on_hit_mob
execute if score #bow_hurt_time vexp.math matches 1.. run tag @s add vexp.arrow.mob_hit_called
execute if score #bow_hurt_time vexp.math matches 1.. run kill @s
