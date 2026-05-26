# dungeons/bow/arrows/hooks/on_hit_mob.mcfunction
# @s is a tagged bow arrow that has hit a mob
# Routes to type-specific handlers with tier variants, with special charged behavior for tier 3

# Resolve owning player for custom logic.
function vexp:dungeons/weapons/bow/arrows/hooks/tag_owner

# Capture final arrow damage for indicator text (rounded up to integer like melee indicators).
# Probe markers store cached value in data.vexp.arrow_damage.
scoreboard players set #bow_hit_damage_raw vexp.math 0
execute store result score #bow_hit_damage_raw vexp.math run data get entity @s data.vexp.arrow_damage 100
execute if score #bow_hit_damage_raw vexp.math matches 0 run execute store result score #bow_hit_damage_raw vexp.math run data get entity @s damage 100
scoreboard players operation #damage vexp.math = #bow_hit_damage_raw vexp.math
scoreboard players add #damage vexp.math 99
scoreboard players operation #damage vexp.math /= #force_scale vexp.math
scoreboard players set #bow_indicator_charged vexp.math 0
execute if entity @s[tag=vexp.combo_arrow_charged] run scoreboard players set #bow_indicator_charged vexp.math 1

# Common arrow
execute if entity @s[tag=vexp.common_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/common/on_hit_mob
execute if entity @s[tag=vexp.common_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/common/on_hit_mob_charged

# Netherite arrow
execute if entity @s[tag=vexp.netherite_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/netherite/on_hit_mob
execute if entity @s[tag=vexp.netherite_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/netherite/on_hit_mob_charged

# Resonance arrow
execute if entity @s[tag=vexp.resonance_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/resonance/on_hit_mob
execute if entity @s[tag=vexp.resonance_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/resonance/on_hit_mob_charged

# Gold arrow
execute if entity @s[tag=vexp.gold_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/gold/on_hit_mob
execute if entity @s[tag=vexp.gold_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/gold/on_hit_mob_charged

# Diamond arrow
execute if entity @s[tag=vexp.diamond_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/diamond/on_hit_mob
execute if entity @s[tag=vexp.diamond_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/diamond/on_hit_mob_charged

# Glowing arrow
execute if entity @s[tag=vexp.glowing_arrow,tag=!vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/glowing/on_hit_mob
execute if entity @s[tag=vexp.glowing_arrow,tag=vexp.combo_arrow_charged] run function vexp:dungeons/weapons/bow/arrows/types/glowing/on_hit_mob_charged

# Mark impacted mob (vexp.hitted) and spawn damage indicator near arrow collision point.
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:dungeons/weapons/bow/arrows/hooks/spawn_damage_indicator
scoreboard players set #bow_indicator_charged vexp.math 0
