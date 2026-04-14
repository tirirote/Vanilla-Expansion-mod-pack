# dungeons/bow/resonance/on_right_click.mcfunction
# @s is the player

# Placeholder special behavior for resonance bow
particle minecraft:sculk_charge_pop ~ ~1 ~ 0.2 0.2 0.2 0.02 6
function vexp:utils/sound {sound: "minecraft:block.sculk_shrieker.shriek", type: "player"}
