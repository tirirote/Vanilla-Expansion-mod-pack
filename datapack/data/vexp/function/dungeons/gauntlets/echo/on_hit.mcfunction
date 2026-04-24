# dungeons/gauntlets/netherite/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark mob
function vexp:dungeons/states/echo_marked

# Atraer ligeramente (fuerza negativa, y:0.15 para evitar que la fricción lo pegue al suelo)
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_punch_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/echo_hit
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk.break", type: "player"}
