# dungeons/bow/arrows/types/gold/on_hit_mob_charged.mcfunction
# @s is a gold-quality bow arrow, fully charged, hitting a mob

# Buff
execute as @p[tag=vexp.arrow.owner,limit=1] run function vexp:dungeons/states/gold_buffed

# Feedback
function vexp:dungeons/fx/hits/gold_hit
