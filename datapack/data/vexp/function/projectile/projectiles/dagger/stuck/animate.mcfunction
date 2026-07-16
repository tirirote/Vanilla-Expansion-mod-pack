# Stuck Animate
# Ejecutado AS @s (marker dagger_stuck) AT @s
# Anima el balanceo del visual clavado

# Incrementar frame de animación (0-20 para un ciclo suave)
scoreboard players add @s vexp.anim_frame 1
execute if score @s vexp.anim_frame matches 6.. run scoreboard players set @s vexp.anim_frame 6


# Aplicar animación
execute if score @s vexp.anim_frame matches 0..2 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [0.95f,0.707f,0f,1.303f]
execute if score @s vexp.anim_frame matches 2..4 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [1.101f,0.707f,0f,0.95f]
execute if score @s vexp.anim_frame matches 4..6 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [0.95f,0.707f,0f,1.101f]
execute if score @s vexp.anim_frame matches 6.. as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [1f,0.707f,0f,1f]
