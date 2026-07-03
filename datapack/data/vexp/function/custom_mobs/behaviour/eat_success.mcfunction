# When custom mob eats the item
# @s is the custom mob

# 1. Custom on eat success hook
$function vexp:custom_mobs/mobs/$(type)/on_eat_success

# 2. Cleanup
data remove entity @s equipment.mainhand
execute if entity @s[tag=vexp.mob_got_item] run tag @s remove vexp.mob_got_item

#3. Sound
function vexp:utils/sound {sound: "minecraft:entity.generic.eat", type: "player"}
