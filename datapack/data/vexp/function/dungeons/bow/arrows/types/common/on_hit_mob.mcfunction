# dungeons/bow/arrows/types/common/on_hit_mob.mcfunction
# @s is a common-quality bow arrow
execute as @e[predicate=vexp:is_target,sort=nearest,limit=1] if data entity @s HurtTime at @s run function vexp:utils/motion/apply_knockback {strength:-0.1, y:0.1}

#Feedback
particle minecraft:crit ~ ~ ~ .2 .2 .2 0.5 5
function vexp:utils/sound {sound: "minecraft:entity.player.attack.weak", type: "player"}
