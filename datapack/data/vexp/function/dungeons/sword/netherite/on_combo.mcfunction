# dungeons/sword/netherite/on_combo.mcfunction
# @s is the combo-hit mob. Projectile volley is fired by the attacker.

# Launch 3 short-range nether slashes from the attacker.
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~.25 ~ run function vexp:dungeons/sword/netherite/wave

function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.25}

# Cast feedback.
particle minecraft:large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.1 3
particle minecraft:flame ~ ~1 ~ 0.25 0.25 0.25 0.03 3
particle minecraft:lava ~ ~1 ~ 0.25 0.25 0.25 0.03 3
particle explosion ~ ~1 ~ 0 0 0 1 1
function vexp:utils/sound {sound: "minecraft:entity.generic.explode", type: "player"}
