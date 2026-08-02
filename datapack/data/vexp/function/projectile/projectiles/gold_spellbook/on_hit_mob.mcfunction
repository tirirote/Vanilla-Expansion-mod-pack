# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob

# Small Knockback
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:utils/motion/apply_knockback {strength:-0.1, y:0.1}

function vexp:utils/feedback/trail_particle {col:-655515, duration:15, dX:1, dY:1, dZ:1, count:5, speed:1}
function vexp:dungeons/fx/hits/gold_hit
function vexp:utils/sound {sound: "minecraft:entity.shulker_bullet.hit", type: "player", pitch:1}
