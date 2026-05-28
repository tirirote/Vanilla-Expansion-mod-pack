# utils/feedback/swoosh/spawn_swoosh.mcfunction
# @s is the player
# Params:
# - $(model)
# - $(position) local coords, ex: ^ ^1 ^
# - $(face_player) 1 = follow attacker rotation, 0 = fixed rotation
# - $(scale) global scale multiplier for the full animation
# - $(random_scale) 1 = use random spawn scale variants, 0 = fixed scale
# - $(random_pos) jitter multiplier (0.0 = no jitter, 1.0 = base jitter, >1.0 = stronger)
# - $(lifetime) total swoosh lifetime in ticks

$execute as @p[tag=vexp.attacker,limit=1] as @e[tag=vexp.hitted,sort=nearest,distance=..16] at @s positioned $(position) run function vexp:utils/feedback/swoosh/spawn {item_id:"minecraft:firework_rocket",model:"$(model)",face_player:$(face_player),scale:$(scale),random_scale:$(random_scale),random_pos:$(random_pos),lifetime:$(lifetime)}
