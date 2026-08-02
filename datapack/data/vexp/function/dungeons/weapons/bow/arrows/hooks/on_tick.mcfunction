# dungeons/bow/arrows/hooks/on_tick.mcfunction
# @s is a tagged bow arrow
# Routes to type-specific handlers: normal (not fully charged) or charged

# Resolve owning player for custom logic.
function vexp:dungeons/weapons/bow/arrows/hooks/tag_owner

# Common arrow
execute if entity @s[tag=vexp.common_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/common/on_tick
execute if entity @s[tag=vexp.common_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/common/on_tick_charged

# Netherite arrow
execute if entity @s[tag=vexp.netherite_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/netherite/on_tick
execute if entity @s[tag=vexp.netherite_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/netherite/on_tick_charged

# Resonance arrow
execute if entity @s[tag=vexp.resonance_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/resonance/on_tick
execute if entity @s[tag=vexp.resonance_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/resonance/on_tick_charged

# Gold arrow
execute if entity @s[tag=vexp.gold_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/gold/on_tick
execute if entity @s[tag=vexp.gold_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/gold/on_tick_charged

# Diamond arrow
execute if entity @s[tag=vexp.diamond_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/diamond/on_tick
execute if entity @s[tag=vexp.diamond_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/diamond/on_tick_charged

# Glowing arrow
execute if entity @s[tag=vexp.glowing_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/glowing/on_tick
execute if entity @s[tag=vexp.glowing_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/glowing/on_tick_charged

# Bone arrow
execute if entity @s[tag=vexp.bone_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/bone/on_tick
execute if entity @s[tag=vexp.bone_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/bone/on_tick_charged
