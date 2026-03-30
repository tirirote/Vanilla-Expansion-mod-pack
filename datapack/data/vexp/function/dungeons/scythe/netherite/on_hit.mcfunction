# dungeons/scythe/netherite/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

#Tag Mob
function vexp:dungeons/states/nether_marked

# Knockback {strength:1.0, y:0.2}
function vexp:utils/motion/apply_knockback {strength:1.0, y:0.2}

# Player effects
effect give @p[tag=vexp.attacker] minecraft:resistance 1 0 true
effect give @p[tag=vexp.attacker] minecraft:slowness 1 0 true

execute positioned ~ ~1 ~ run function vexp:utils/hits/fire_hit

function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
