# dungeons/spear/netherite/on_combo.mcfunction
# @s is the target entity

# Combo finisher
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:dungeons/weapons/spear/combo_finisher

# Aeo Wave Feedback
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^5 run function vexp:dungeons/fx/aeo_waves/netherite
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^6 run function vexp:dungeons/fx/aeo_waves/netherite
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^7 run function vexp:dungeons/fx/aeo_waves/netherite
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^8 run function vexp:dungeons/fx/aeo_waves/netherite

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/netherite_hit
