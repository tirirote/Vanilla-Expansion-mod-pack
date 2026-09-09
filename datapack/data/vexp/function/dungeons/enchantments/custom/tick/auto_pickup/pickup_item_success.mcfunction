# When pickup success
# @s is the item to be pick up
data modify entity @s Glowing set value true
team join vexp.light_purple

#2. Feedback
execute as @p[tag=vexp.autopickup_owner,limit=1] at @s positioned ~ ~1.4 ~ run particle instant_effect{color:16733686,power:1} ^ ^ ^6 .1 .1 .1 0 1
execute as @p[tag=vexp.autopickup_owner,limit=1] at @s positioned ~ ~1.4 ~ run particle instant_effect{color:13835748,power:1} ^ ^ ^5 .1 .1 .1 0 1
execute as @p[tag=vexp.autopickup_owner,limit=1] at @s positioned ~ ~1.4 ~ run particle instant_effect{color:10095813,power:1} ^ ^ ^4 .1 .1 .1 0 1
execute as @p[tag=vexp.autopickup_owner,limit=1] at @s positioned ~ ~1.4 ~ run particle instant_effect{color:8717519,power:1} ^ ^ ^3 .1 .1 .1 0 1
execute as @p[tag=vexp.autopickup_owner,limit=1] at @s positioned ~ ~1.4 ~ run particle instant_effect{color:7078068,power:1} ^ ^ ^2 .1 .1 .1 0 1
execute as @p[tag=vexp.autopickup_owner,limit=1] at @s positioned ~ ~1.4 ~ run particle instant_effect{color:6425302,power:1} ^ ^ ^1 .1 .1 .1 0 1

execute as @p[tag=vexp.autopickup_owner,limit=1] at @s run function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}

#3. Tp item to player
execute as @p[tag=vexp.autopickup_owner,limit=1] at @s positioned ~ ~1.3 ~ run tp @e[type=item,tag=vexp.autopickup_target] ^ ^ ^1.25
data modify entity @s PickupDelay set value 3
