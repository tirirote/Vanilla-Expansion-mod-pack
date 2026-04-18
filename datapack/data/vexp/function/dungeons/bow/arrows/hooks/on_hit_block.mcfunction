# dungeons/bow/arrows/hooks/on_hit_block.mcfunction
# @s is a tagged bow arrow that has hit a block
# Routes to type-specific handlers: normal or charged

# Common arrow
execute if entity @s[tag=vexp.common_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/common/on_hit_block
execute if entity @s[tag=vexp.common_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/common/on_hit_block_charged

# Netherite arrow
execute if entity @s[tag=vexp.netherite_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/netherite/on_hit_block
execute if entity @s[tag=vexp.netherite_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/netherite/on_hit_block_charged

# Resonance arrow
execute if entity @s[tag=vexp.resonance_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/resonance/on_hit_block
execute if entity @s[tag=vexp.resonance_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/resonance/on_hit_block_charged

#Common feedback
execute positioned ^ ^-0.2 ^0.2 run function vexp:utils/feedback/block_hit

