# dungeons/bow/resonance/on_combo.mcfunction
# @s is the target entity

#Mark the target
function vexp:dungeons/states/echo_marked

# Default combo impact feedback for bows
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.2}
execute as @p[tag=vexp.attacker,limit=1] at @s run function vexp:dungeons/weapons/bow/player_pushback

execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_punch_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
