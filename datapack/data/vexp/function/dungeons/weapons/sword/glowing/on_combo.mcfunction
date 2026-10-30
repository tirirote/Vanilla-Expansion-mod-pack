# Sword on combo hook
# @s is the target entity

# Combo finisher
function vexp:dungeons/weapons/sword/combo_finisher

# Mark mob
function vexp:dungeons/states/glow_marked

# Feedback
execute as @p[tag=vexp.attacker,limit=1] at @s run function vexp:dungeons/fx/hits/glowing_special
