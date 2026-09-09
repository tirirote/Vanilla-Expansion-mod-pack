# dungeons/armor/types/resonance/on_hit.mcfunction
# Triggered when player lands a hit with combo hitbox
execute as @e[tag=vexp.hitted,distance=..16] run function vexp:dungeons/states/echo_ghost_hit
