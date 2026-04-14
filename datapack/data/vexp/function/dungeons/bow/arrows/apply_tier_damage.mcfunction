# dungeons/bow/arrows/apply_tier_damage.mcfunction
# @s is a tagged bow arrow with vexp.bow_arrow tag
# Applies damage based on arrow quality and variant (normal or charged) using centralized config

# Common arrows
execute if entity @s[tag=vexp.common_arrow,tag=!vexp.combo_arrow_charged] run data modify entity @s damage set from storage vexp:arrow_config common.normal
execute if entity @s[tag=vexp.common_arrow,tag=vexp.combo_arrow_charged] run data modify entity @s damage set from storage vexp:arrow_config common.charged

# Netherite arrows
execute if entity @s[tag=vexp.netherite_arrow,tag=!vexp.combo_arrow_charged] run data modify entity @s damage set from storage vexp:arrow_config netherite.normal
execute if entity @s[tag=vexp.netherite_arrow,tag=vexp.combo_arrow_charged] run data modify entity @s damage set from storage vexp:arrow_config netherite.charged

# Resonance arrows
execute if entity @s[tag=vexp.resonance_arrow,tag=!vexp.combo_arrow_charged] run data modify entity @s damage set from storage vexp:arrow_config resonance.normal
execute if entity @s[tag=vexp.resonance_arrow,tag=vexp.combo_arrow_charged] run data modify entity @s damage set from storage vexp:arrow_config resonance.charged
