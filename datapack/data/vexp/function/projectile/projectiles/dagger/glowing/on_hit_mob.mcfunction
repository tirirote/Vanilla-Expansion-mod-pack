# On hit mob custom hook
# @s is the dagger

#Buff
execute as @p[tag=vexp.dagger_owner,limit=1] run function vexp:dungeons/states/glow_buffed

#Knockback
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] unless entity @s[tag=vexp.dagger_owner] run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] unless entity @s[tag=vexp.dagger_owner] run function vexp:dungeons/states/glow_marked

#Feedback
function vexp:dungeons/fx/hits/glowing_hit
function vexp:dungeons/fx/aeo_waves/glowing
