# Trigger custom hurt hook
$function vexp:custom_mobs/mobs/$(type)/on_hurt_tick
$execute if entity @s[nbt={HurtTime:10s}] run function vexp:custom_mobs/mobs/$(type)/on_hurt
