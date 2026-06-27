# Feedback
$execute if entity @s[nbt={Item:{id:"minecraft:$(item)"}}] run particle large_smoke ~ ~ ~ 0.1 0.1 0.1 0.02 1
$execute if entity @s[nbt={Item:{id:"minecraft:$(item)"}}] run particle flame ~ ~ ~ 0 0 0 0.02 1
$execute if entity @s[nbt={Item:{id:"minecraft:$(item)"}}] run function vexp:utils/sound {sound: "minecraft:block.fire.extinguish", type: "player"}

# Smelt
$execute if entity @s[nbt={Item:{id:"minecraft:$(item)"}}] run data modify entity @s Item.id set value "minecraft:$(smelted_item)"
# Tag Item
tag @s add vexp.enchantment_smelted
