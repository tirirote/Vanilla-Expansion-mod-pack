# Trigger custom hurt hook
$function vexp:custom_mobs/mobs/$(type)/on_hurt_tick

$execute if entity @s[nbt={HurtTime:10s}] run function vexp:custom_mobs/mobs/$(type)/on_hurt

# Drop item when mob has custom pickup behaviour
execute if entity @s[tag=vexp.mob_got_item] if entity @s[nbt={HurtTime:10s}] run function vexp:custom_mobs/behaviour/drop_item
