# dungeons/bow/arrows/types/common/on_hit_mob_charged.mcfunction
# @s is a common-quality bow arrow, fully charged, hitting a mob
execute as @e[predicate=vexp:is_target,sort=nearest,limit=1] if data entity @s HurtTime at @s run function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.25}

#Visuals
particle minecraft:crit ~ ~ ~ 0.2 0.2 0.2 0.5 10
particle minecraft:instant_effect ~ ~ ~ .2 .2 .2 0 3
particle minecraft:flash{color:-1} ~ ~ ~ 0 0 0 0 1
function vexp:utils/sound {sound: "minecraft:item.trident.hit_ground", type: "player"}
