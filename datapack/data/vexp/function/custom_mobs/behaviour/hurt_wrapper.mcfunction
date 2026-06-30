# Trigger custom hurt hook
$function vexp:custom_mobs/mobs/$(type)/on_hurt_tick

$execute if entity @s[nbt={HurtTime:10s}] run function vexp:custom_mobs/mobs/$(type)/on_hurt

# Drop item when mob has custom pickup behaviour
$scoreboard players set @s vexp.mob_can_pickup $(can_pickup_item)
execute if score @s vexp.mob_can_pickup matches 1.. if entity @s[nbt={HurtTime:10s}] if data entity @s equipment.mainhand run function vexp:custom_mobs/behaviour/drop_item
