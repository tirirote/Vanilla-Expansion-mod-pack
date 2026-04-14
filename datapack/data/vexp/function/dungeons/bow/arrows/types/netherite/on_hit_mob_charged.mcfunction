# dungeons/bow/arrows/types/netherite/on_hit_mob_charged.mcfunction
# @s is a netherite-quality bow arrow, fully charged, hitting a mob

particle minecraft:lava ~ ~1 ~ 0.2 0.2 0.2 0.02 8
particle minecraft:flame ~ ~1 ~ 0.15 0.15 0.15 0.02 6
particle minecraft:explosion ~ ~1 ~ 0.35 0.35 0.35 0.05 5
particle minecraft:large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.05 6
data modify entity @s Fire set value 60
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
