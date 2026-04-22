# dungeons/sword/on_combo.mcfunction
# @s is the target entity

# Push wave
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s positioned ~ ~1 ~ run function vexp:dungeons/sword/echo/wave
# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
particle flash{color:-8454162} ~ ~ ~ 0 0 0 0 0
particle instant_effect{color:9497087} ~ ~1 ~ 0.2 0.2 0.2 0 1
particle sculk_charge_pop ~ ~ ~ 0.25 0.25 0.25 0.1 3

function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk.break", type: "player"}
