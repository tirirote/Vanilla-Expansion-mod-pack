# When pickup success
#1. Clean tag for player

#2. Feedback
execute as @e[type=item,sort=nearest,distance=..12,nbt={Age:1s}] at @s run particle instant_effect{color:3544371,power:-1} ~ ~ ~ .1 .1 .1 0.1 3
execute positioned ~ ~1.25 ~ run particle instant_effect{color:3544371} ^ ^ ^5 0 0 0 0 0
execute positioned ~ ~1.25 ~ run particle instant_effect{color:5249365} ^ ^ ^4 0 0 0 0 0
execute positioned ~ ~1.25 ~ run particle instant_effect{color:8266105} ^ ^ ^3 0 0 0 0 0
execute positioned ~ ~1.25 ~ run particle instant_effect{color:11481001} ^ ^ ^2 0 0 0 0 0
execute positioned ~ ~1.25 ~ run particle instant_effect{color:15952062} ^ ^ ^1 0 0 0 0 0

#3. Tp item to player
execute positioned ~ ~1.25 ~ run tp @e[type=item,sort=nearest,distance=..12,nbt={Age:1s}] ^ ^ ^1
execute as @e[type=item,sort=nearest,nbt={Age:1s},distance=..2] run data modify entity @s PickupDelay set value 0

execute run function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}

#4. Clean tag
tag @s remove vexp.enchantment_pickup_owner
