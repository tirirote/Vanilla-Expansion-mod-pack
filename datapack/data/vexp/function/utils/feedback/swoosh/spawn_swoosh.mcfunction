# utils/feedback/swoosh/spawn_swoosh.mcfunction
# @s is the player
# Params:
# - $(model)
# - $(position) local coords, ex: ^ ^1 ^
# - $(face_player) 1 = follow attacker rotation, 0 = fixed rotation
# - $(scale) global scale multiplier for the full animation
# - $(random_pos) jitter multiplier (0.0 = no jitter, 1.0 = base jitter, >1.0 = stronger)
# - $(lifetime) total swoosh lifetime in ticks
# - $(spawn_on_player) 1 = spawn at attacker position, 0 = spawn at hit target
# - $(follow_owner) 1 = tp swoosh to owner each tick, 0 = static position
# - $(follow_offset_x) local X offset used when follow_owner=1
# - $(follow_offset_y) local Y offset used when follow_owner=1
# - $(follow_offset_z) local Z offset used when follow_owner=1

$scoreboard players set #swoosh_spawn_on_player vexp.math $(spawn_on_player)

$execute unless score #swoosh_spawn_on_player vexp.math matches 1.. unless entity @s[type=item_display,tag=vexp.custom_block.dummy] as @p[tag=vexp.attacker,limit=1] as @e[tag=vexp.hitted,predicate=vexp:is_target,sort=nearest,distance=..32] at @s positioned $(position) run function vexp:utils/feedback/swoosh/spawn {item_id:"minecraft:firework_rocket",model:"$(model)",face_player:$(face_player),scale:$(scale),random_pos:$(random_pos),lifetime:$(lifetime),follow_owner:$(follow_owner),follow_offset_x:$(follow_offset_x),follow_offset_y:$(follow_offset_y),follow_offset_z:$(follow_offset_z)}

$execute if score #swoosh_spawn_on_player vexp.math matches 1.. unless entity @s[type=item_display,tag=vexp.custom_block.dummy] as @p[tag=vexp.attacker,limit=1] at @s positioned $(position) run function vexp:utils/feedback/swoosh/spawn {item_id:"minecraft:firework_rocket",model:"$(model)",face_player:$(face_player),scale:$(scale),random_pos:$(random_pos),lifetime:$(lifetime),follow_owner:$(follow_owner),follow_offset_x:$(follow_offset_x),follow_offset_y:$(follow_offset_y),follow_offset_z:$(follow_offset_z)}
