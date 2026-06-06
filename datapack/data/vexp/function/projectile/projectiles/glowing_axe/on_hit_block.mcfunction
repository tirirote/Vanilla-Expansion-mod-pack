# dungeons/glowing_axe/projectile/on_hit_block.mcfunction
# @s is the proj
tag @s add vexp.prevent_despawn

execute positioned ^ ^ ^0.5 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ^0.5 ^ ^ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ^-0.5 ^ ^ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ^ ^0.5 ^ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ^ ^-0.5 ^ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
