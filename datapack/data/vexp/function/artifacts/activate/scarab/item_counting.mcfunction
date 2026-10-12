# Counting until items duplicated

execute as @p[tag=vexp.scarab_owner,limit=1] run scoreboard players add @s vexp.scarab_item_count 1
execute as @p[tag=vexp.scarab_owner,limit=1] run function vexp:utils/sound {sound: "minecraft:block.large_amethyst_bud.place", type: "player", pitch:1}

data modify entity @s Glowing set value true
team join vexp.yellow
particle instant_effect{color:11140976,power:2} ~ ~ ~ 0 0 0 1 1
particle instant_effect{color:16772690,power:2} ~ ~ ~ 0 0 0 1 1

tag @s add vexp.scarab_count
