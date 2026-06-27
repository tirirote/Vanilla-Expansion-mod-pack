# dungeons/bow/arrows/types/resonance/on_hit_mob_charged.mcfunction
# @s is a resonance-quality bow arrow, fully charged, hitting a mob

# Mark the target
execute as @e[predicate=vexp:is_target,sort=nearest,limit=1,distance=..2] run function vexp:dungeons/states/glow_marked

# Buff
execute as @p[tag=vexp.arrow.owner,limit=1] run function vexp:dungeons/states/glow_buffed

#Feedback
function vexp:dungeons/fx/hits/glowing_hit
