# store_container_target.mcfunction
# Colocacion estricta: el contenedor debe estar justo detras del candado (^ ^ ^-1)
# y su facing debe coincidir con la rotacion cardinal del candado.

# Candado mirando al sur (yaw -45..45) -> contenedor al norte, facing sur.
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=135..-135] positioned ^ ^ ^-1 if block ~ ~ ~ chest[facing=south] run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=135..-135] positioned ^ ^ ^-1 if block ~ ~ ~ trapped_chest[facing=south] run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=135..-135] positioned ^ ^ ^-1 if block ~ ~ ~ barrel[facing=south] run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"container"} if entity @s[y_rotation=135..-135] run data modify entity @s data.vexp.target_offset set value "north"

# Candado mirando al oeste (yaw 45..135) -> contenedor al este, facing oeste.
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^-1 if block ~ ~ ~ chest[facing=west] run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^-1 if block ~ ~ ~ trapped_chest[facing=west] run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^-1 if block ~ ~ ~ barrel[facing=west] run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"container"} if entity @s[y_rotation=-135..-45] run data modify entity @s data.vexp.target_offset set value "east"

# Candado mirando al este (yaw -135..-45) -> contenedor al oeste, facing este.
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=45..135] positioned ^ ^ ^-1 if block ~ ~ ~ chest[facing=east] run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=45..135] positioned ^ ^ ^-1 if block ~ ~ ~ trapped_chest[facing=east] run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=45..135] positioned ^ ^ ^-1 if block ~ ~ ~ barrel[facing=east] run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"container"} if entity @s[y_rotation=45..135] run data modify entity @s data.vexp.target_offset set value "west"

# Candado mirando al norte (yaw 136..180 o -180..-136) -> contenedor al sur, facing norte.
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^-1 if block ~ ~ ~ chest[facing=north] run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^-1 if block ~ ~ ~ trapped_chest[facing=north] run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^-1 if block ~ ~ ~ barrel[facing=north] run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"container"} if entity @s[y_rotation=-45..45] run data modify entity @s data.vexp.target_offset set value "south"

# Shulkers sin orientación
execute if data entity @s data.vexp{target_type:"none"} positioned ^ ^ ^-1 if block ~ ~ ~ #shulker_boxes run data modify entity @s data.vexp.target_type set value "container"
execute if data entity @s data.vexp{target_type:"container"} run data modify entity @s data.vexp.target_offset set value "self"
