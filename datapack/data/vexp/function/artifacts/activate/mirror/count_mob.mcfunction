# Counting until items duplicated

execute as @p[tag=vexp.mirror_owner,limit=1] run scoreboard players add @s vexp.mirror_mob_count 1
execute as @p[tag=vexp.mirror_owner,limit=1] run function vexp:utils/sound {sound: "minecraft:entity.evoker.cast_spell", type: "player", pitch:1}

data modify entity @s Glowing set value true
team join vexp.yellow
particle instant_effect{color:11140976,power:2} ~ ~ ~ 0 0 0 1 1
particle instant_effect{color:16772690,power:2} ~ ~ ~ 0 0 0 1 1

# Link this mob to its owner for later exact-match cleanup checks (not the shared vexp.id).
scoreboard players operation @s vexp.mirror_owner_id = @p[tag=vexp.mirror_owner,limit=1] vexp.id
tag @s add vexp.mirror_mob_marked
