# dungeons/scythe/netherite/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

#Tag Mob
function vexp:dungeons/states/nether_marked

# Knockback {strength:1.0, y:0.2}
function vexp:utils/motion/apply_knockback {strength:1.5, y:0.2}

# Player effects
effect give @p[tag=vexp.attacker] minecraft:resistance 1 0 true
effect give @p[tag=vexp.attacker] minecraft:slowness 1 0 true

#Fedback
function vexp:utils/hits/weak_sword_hit
particle large_smoke ~ ~1 ~ .2 .2 .2 0.1 3
particle lava ~ ~1 ~ .2 .2 .2 0 1

function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
