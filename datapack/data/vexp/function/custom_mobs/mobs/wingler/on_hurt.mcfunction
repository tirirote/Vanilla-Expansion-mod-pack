# Custom on Hurt hook
# @s is the custom mob
execute if block ^ ^ ^0.5 #replaceable rotated ~180 ~ run tp @s ^ ^ ^0.5
function vexp:utils/sound {sound: "minecraft:entity.parrot.hurt", type: "player"}

#execute if data entity @s equipment.head run function vexp:custom_mobs/mobs/wingler/drop_item
