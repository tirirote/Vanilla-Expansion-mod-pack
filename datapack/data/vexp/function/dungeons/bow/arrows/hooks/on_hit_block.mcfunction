# dungeons/bow/arrows/hooks/on_hit_block.mcfunction
# @s is a tagged bow arrow that has hit a block
# Routes to type-specific handlers: normal or charged

# Resolve owning player for custom logic.
function vexp:dungeons/bow/arrows/hooks/tag_owner

# Common arrow
execute if entity @s[tag=vexp.common_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/common/on_hit_block
execute if entity @s[tag=vexp.common_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/common/on_hit_block_charged

# Netherite arrow
execute if entity @s[tag=vexp.netherite_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/netherite/on_hit_block
execute if entity @s[tag=vexp.netherite_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/netherite/on_hit_block_charged

# Resonance arrow
execute if entity @s[tag=vexp.resonance_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/resonance/on_hit_block
execute if entity @s[tag=vexp.resonance_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/resonance/on_hit_block_charged

# Gold arrow
execute if entity @s[tag=vexp.gold_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/gold/on_hit_block
execute if entity @s[tag=vexp.gold_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/gold/on_hit_block_charged

# Diamond arrow
execute if entity @s[tag=vexp.diamond_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/diamond/on_hit_block
execute if entity @s[tag=vexp.diamond_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/diamond/on_hit_block_charged

# Diamond arrow
execute if entity @s[tag=vexp.glowing_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/glowing/on_hit_block
execute if entity @s[tag=vexp.glowing_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/bow/arrows/types/glowing/on_hit_block_charged

#Common feedback
execute positioned ^ ^-0.2 ^0.2 run function vexp:utils/feedback/block_hit

