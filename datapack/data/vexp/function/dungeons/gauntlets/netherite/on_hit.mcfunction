# dungeons/gauntlets/netherite/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark mob
function vexp:dungeons/states/nether_marked

# Player buffs
effect give @p[tag=vexp.attacker,limit=1] minecraft:resistance 1 0 true
effect give @p[tag=vexp.attacker,limit=1] minecraft:slowness 1 0 true

# Knockback {strength:0.25, y:0.2}
function vexp:utils/motion/apply_knockback {strength:0.25, y:0.1}

function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
