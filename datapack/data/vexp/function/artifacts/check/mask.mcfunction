# Mask check for activation
tag @s add vexp.mask_owner

# Up to 3 mob become friends and attacks other hostile
execute as @e[type=#vexp:hostile,tag=!vexp.custom_block.dummy_mob,nbt={HurtTime:10s},distance=..16,sort=nearest,limit=3] unless entity @s[tag=vexp.mask_friend] at @s run function vexp:artifacts/activate/mask/count_mob

# When at least 3 hitted mobs, activate mask
execute if score @s vexp.mask_mob_count matches 3 run function vexp:artifacts/activate/mask
execute if score @s vexp.mask_mob_count matches 3.. unless entity @e[tag=vexp.mask_friend,distance=..16] run scoreboard players set @s vexp.mask_mob_count 0

tag @s remove vexp.mask_owner
