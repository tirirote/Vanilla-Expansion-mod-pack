# dungeons/spear/echo/on_combo.mcfunction
# @s is the target entity

# Combo finisher
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:dungeons/weapons/spear/combo_finisher

# Aeo Wave Feedback
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^5 run function vexp:dungeons/fx/aeo_waves/echo
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^6 run function vexp:dungeons/fx/aeo_waves/echo
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^7 run function vexp:dungeons/fx/aeo_waves/echo
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^8 run function vexp:dungeons/fx/aeo_waves/echo

#TP Player behind mob
execute as @e[tag=vexp.echo_marked,tag=vexp.hitted,predicate=vexp:is_target,distance=..12,limit=1] facing entity @p[tag=vexp.attacker,limit=1] feet positioned ~ ~.5 ~ if block ^ ^ ^-3.5 #replaceable run tp @p[tag=vexp.attacker,limit=1] ^ ^ ^-3.5 facing entity @s

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit
