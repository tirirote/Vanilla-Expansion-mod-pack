# dungeons/bow/arrows/types/diamond/on_hit_mob_charged.mcfunction
# @s is a diamond-quality bow arrow, fully charged, hitting a mob

# Buff
execute as @p[tag=vexp.arrow.owner,limit=1] run function vexp:dungeons/states/diamond_buffed

# Feedback
function vexp:dungeons/fx/hits/weak_diamond_hit
