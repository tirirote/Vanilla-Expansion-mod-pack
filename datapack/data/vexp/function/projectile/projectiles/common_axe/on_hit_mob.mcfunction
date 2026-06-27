# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob


# Small Knockback
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.2}

particle angry_villager ~ ~ ~ 0.35 0.35 0.35 1 3
particle minecraft:flash{color:-5463417} ~ ~ ~ 0 0 0 0 0
function vexp:utils/sound {sound: "minecraft:entity.player.attack.crit", type: "player"}
