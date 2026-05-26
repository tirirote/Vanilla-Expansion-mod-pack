# dungeons/bow/on_combo.mcfunction
# @s is the target entity

# Default combo impact feedback for bows
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.2}
execute as @p[tag=vexp.attacker,limit=1] at @s run function vexp:dungeons/weapons/bow/player_pushback

# Brief buff
effect give @s speed 2 1 true

execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_punch_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/gold_hit
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
