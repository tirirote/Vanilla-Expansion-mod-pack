# Check lock display when mounted on a door

# Cerrada (mismo offset para delante y detrás)
# Parte de abajo
execute unless entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [-0.25f,0.75f,0f]
execute unless entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]

execute if entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [0.25f,0.75f,0f]
execute if entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]

# Parte de arriba
execute unless entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [-0.25f,-0.25f,0f]
execute unless entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]

execute if entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [0.25f,-0.25f,0f]
execute if entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]

# Abierta (mismo offset para delante y detrás)
# Parte de abajo
execute unless entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [0.3f,0.75f,0.75f]
execute unless entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,-1f,0f,1f]

execute if entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [-0.3f,0.75f,0.75f]
execute if entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,1f,0f,1f]

# Parte de arriba
execute unless entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [0.3f,-0.25f,0.75f]
execute unless entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,-1f,0f,1f]

execute if entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [-0.3f,-0.25f,0.75f]
execute if entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,1f,0f,1f]

tag @s add vexp.lock_display_updated
