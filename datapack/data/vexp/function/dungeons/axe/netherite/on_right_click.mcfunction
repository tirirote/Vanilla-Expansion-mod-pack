# @s is the player

# Mark throw owner
tag @s add vexp.projectile_owner

# Spawn throw projectile in front of the player
execute rotated as @s run summon minecraft:marker ^ ^ ^0.8 {Tags:["vexp.projectile","vexp.temp_projectile","vexp.axe_nether_projectile"],data:{proj_type:"nether_axe"}}

# Capture current axe damage on projectile before removing item from hand
execute store result score @e[type=marker,tag=vexp.temp_projectile,tag=vexp.axe_nether_projectile,sort=nearest,limit=1,distance=..3] vexp.damage run data get entity @s SelectedItem.components."minecraft:damage"

# Consume the held axe while it is in flight
item replace entity @s weapon.mainhand with air

# Initialize projectile
execute as @e[type=marker,tag=vexp.temp_projectile,tag=vexp.axe_nether_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

# Throw feedback
particle minecraft:flame ~ ~ ~ 0.3 0.3 0.3 0.03 12
playsound minecraft:item.trident.throw player @a ~ ~ ~ 0.8 0.8
