# sync_pos.mcfunction

# 1. Mantenemos el vindicator sincroizado firmemente
execute as @e[type=vindicator,tag=vexp.custom_block.dummy_mob,distance=..1,limit=1] run tp @s ~ ~ ~ ~180 ~

# 3. Animación de Balanceo (Interpolación fluida basada en cuaterniones)
# Golazo hacia atrás (HurtTime 10) -> Pitch de ~20 grados
execute as @e[type=item_display,tag=vexp.custom_block.display] at @s run function vexp:custom_block/blocks/training_dummy/hit_anim
