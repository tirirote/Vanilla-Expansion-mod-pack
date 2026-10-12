# Ring check for activation
tag @s add vexp.ring_owner

# Find mob candidate to disarm
execute as @e[type=#vexp:hostile,distance=..6,limit=3,nbt={HurtTime:10s}] if items entity @s weapon.mainhand * unless entity @s[tag=vexp.ring_target] at @s run function vexp:artifacts/activate/ring/count_mob

# When at least 3 mobs targetted
execute if score @s vexp.ring_mob_count matches 3.. run function vexp:artifacts/activate/ring

tag @s remove vexp.ring_owner
