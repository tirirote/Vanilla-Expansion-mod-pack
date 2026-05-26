# dungeons/bow/arrows/hooks/tag_owner.mcfunction
# @s is a bow arrow or bow probe entity with data.vexp.owner_id
# Marks the owning player with transient tag vexp.arrow.owner for hook logic.

execute unless score #bow_owner_id vexp.math matches 0 run scoreboard players set #bow_owner_id vexp.math 0
execute if data entity @s data.vexp.owner_id store result score #bow_owner_id vexp.math run data get entity @s data.vexp.owner_id
execute if score #bow_owner_id vexp.math matches 1.. as @a if score @s vexp.id = #bow_owner_id vexp.math run tag @s add vexp.arrow.owner
