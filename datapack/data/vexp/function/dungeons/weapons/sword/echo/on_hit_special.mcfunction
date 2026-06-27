# dungeons/gauntlets/on_hit.mcfunction
# @s is the target entity with vexp.hitted.special

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.05}

# Mark mob
function vexp:dungeons/states/echo_marked

# Buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

# Aeo Wave Feedback
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ run particle sweep_attack ^ ^ ^1 1 1 1 1 0
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^3 run function vexp:dungeons/fx/aeo_waves/echo
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^4 run function vexp:dungeons/fx/aeo_waves/echo
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^5 run function vexp:dungeons/fx/aeo_waves/echo
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^6 run function vexp:dungeons/fx/aeo_waves/echo

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit

# Remove tag
execute as @p[tag=vexp.attacker,limit=1] if entity @s[tag=vexp.hitted.special] run tag @s remove vexp.hitted.special
