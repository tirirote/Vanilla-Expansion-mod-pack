# dungeons/bow/arrows/hooks/spawn_damage_indicator.mcfunction
# @s is the nearest target entity around arrow impact.
# Spawns damage indicator for bow hits.

# Require recent hurt state to avoid spawning indicator on bystanders.
execute store result score #bow_hurt_time vexp.math run data get entity @s HurtTime
execute unless score #bow_hurt_time vexp.math matches 1.. run return 0

# Integrate with combo hit pipeline.
tag @s add vexp.hitted

# Bow indicators use the same visual profile as regular hits.
data modify storage vexp:temp Damage.color set value "yellow"
execute if score #bow_indicator_charged vexp.math matches 1.. run data modify storage vexp:temp Damage.color set value "red"
data modify storage vexp:temp Damage.bold set value false

# Spawn the floating text at target position.
execute if score #damage vexp.math matches 1.. run function vexp:mob_health/spawn_damage
