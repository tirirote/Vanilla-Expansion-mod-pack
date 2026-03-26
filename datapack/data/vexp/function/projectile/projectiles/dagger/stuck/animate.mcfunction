# Stuck Animate
# Ejecutado AS @s (marker dagger_stuck) AT @s
# Anima el balanceo del visual clavado

# Incrementar frame de animación (0-20 para un ciclo suave)
scoreboard players add @s vexp.anim_frame 1
execute if score @s vexp.anim_frame matches 21.. run scoreboard players set @s vexp.anim_frame 0

# Calcular oscilación suave (aproximación de seno)
# Frame 0-10: rotación máxima positiva a máxima negativa
# Frame 10-20: regresa a positiva
scoreboard players set #anim_swing vexp.math 0

execute if score @s vexp.anim_frame matches 0 run scoreboard players set #anim_swing vexp.math 5
execute if score @s vexp.anim_frame matches 1 run scoreboard players set #anim_swing vexp.math 4
execute if score @s vexp.anim_frame matches 2 run scoreboard players set #anim_swing vexp.math 3
execute if score @s vexp.anim_frame matches 3 run scoreboard players set #anim_swing vexp.math 2
execute if score @s vexp.anim_frame matches 4 run scoreboard players set #anim_swing vexp.math 1
execute if score @s vexp.anim_frame matches 5 run scoreboard players set #anim_swing vexp.math 0
execute if score @s vexp.anim_frame matches 6 run scoreboard players set #anim_swing vexp.math -1
execute if score @s vexp.anim_frame matches 7 run scoreboard players set #anim_swing vexp.math -2
execute if score @s vexp.anim_frame matches 8 run scoreboard players set #anim_swing vexp.math -3
execute if score @s vexp.anim_frame matches 9 run scoreboard players set #anim_swing vexp.math -4
execute if score @s vexp.anim_frame matches 10 run scoreboard players set #anim_swing vexp.math -5
execute if score @s vexp.anim_frame matches 11 run scoreboard players set #anim_swing vexp.math -4
execute if score @s vexp.anim_frame matches 12 run scoreboard players set #anim_swing vexp.math -3
execute if score @s vexp.anim_frame matches 13 run scoreboard players set #anim_swing vexp.math -2
execute if score @s vexp.anim_frame matches 14 run scoreboard players set #anim_swing vexp.math -1
execute if score @s vexp.anim_frame matches 15 run scoreboard players set #anim_swing vexp.math 0
execute if score @s vexp.anim_frame matches 16 run scoreboard players set #anim_swing vexp.math 1
execute if score @s vexp.anim_frame matches 17 run scoreboard players set #anim_swing vexp.math 2
execute if score @s vexp.anim_frame matches 18 run scoreboard players set #anim_swing vexp.math 3
execute if score @s vexp.anim_frame matches 19 run scoreboard players set #anim_swing vexp.math 4
execute if score @s vexp.anim_frame matches 20 run scoreboard players set #anim_swing vexp.math 5

# Aplicar rotación animada al visual
execute if score #anim_swing vexp.math matches -5 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [-.25f,.5f,.5f,-.008f]
execute if score #anim_swing vexp.math matches -4 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [-.25f,.5f,.5f,-.006f]
execute if score #anim_swing vexp.math matches -3 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [-.25f,.5f,.5f,-.004f]
execute if score #anim_swing vexp.math matches -2 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [-.25f,.5f,.5f,-.002f]
execute if score #anim_swing vexp.math matches -1 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [-.25f,.5f,.5f,0f]
execute if score #anim_swing vexp.math matches 0 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [-.25f,.5f,.5f,0f]
execute if score #anim_swing vexp.math matches 1 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [-.25f,.5f,.5f,.002f]
execute if score #anim_swing vexp.math matches 2 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [-.25f,.5f,.5f,.004f]
execute if score #anim_swing vexp.math matches 3 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [-.25f,.5f,.5f,.006f]
execute if score #anim_swing vexp.math matches 4 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [-.25f,.5f,.5f,.008f]
execute if score #anim_swing vexp.math matches 5 as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run data modify entity @s transformation.left_rotation set value [-.25f,.5f,.5f,.008f]
