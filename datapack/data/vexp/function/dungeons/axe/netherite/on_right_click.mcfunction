# @s is the player

# Mark throw owner
tag @s add vexp.projectile_owner

# Spawn throw projectile in front of the player
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.axe_nether_projectile",proj_type:"nether_axe",proj_data:{}}
execute rotated as @s positioned ^ ^ ^0.8 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

# Capture current axe damage on projectile before removing item from hand
execute store result score @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,tag=vexp.axe_nether_projectile,sort=nearest,limit=1,distance=..3] vexp.damage run data get entity @s SelectedItem.components."minecraft:damage"

# Consume the held axe while it is in flight
item replace entity @s weapon.mainhand with air

# Initialize projectile
execute as @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,tag=vexp.axe_nether_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

# Throw feedback
particle minecraft:flame ~ ~ ~ 0.3 0.3 0.3 0.03 12
playsound minecraft:item.trident.throw player @a ~ ~ ~ 0.8 0.8
