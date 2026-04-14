# dungeons/bow/netherite/on_right_click.mcfunction
# @s is the player

# Placeholder special behavior for netherite bow
particle minecraft:large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.05 4
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
