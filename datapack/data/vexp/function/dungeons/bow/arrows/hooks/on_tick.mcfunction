# dungeons/bow/arrows/hooks/on_tick.mcfunction
# @s is a tagged bow arrow
# Routes to type-specific handlers: normal (not fully charged) or charged

# Common arrow
execute if entity @s[tag=vexp.common_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/common/on_tick
execute if entity @s[tag=vexp.common_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/common/on_tick_charged

# Netherite arrow
execute if entity @s[tag=vexp.netherite_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/netherite/on_tick
execute if entity @s[tag=vexp.netherite_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/netherite/on_tick_charged

# Resonance arrow
execute if entity @s[tag=vexp.resonance_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/resonance/on_tick
execute if entity @s[tag=vexp.resonance_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/resonance/on_tick_charged
