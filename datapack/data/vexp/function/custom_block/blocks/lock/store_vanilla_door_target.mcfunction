# Detecta puerta vanilla delante o detrás del candado y guarda offset/mount.
# door_mount="front" si la puerta está en la cara frontal.
# door_mount="back"  si la puerta está en la cara trasera (para ajustar display).

# Mirando al sur (yaw -45..45)
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.target_offset set value "south"
execute if data entity @s data.vexp{target_type:"door",target_offset:"south"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.door_mount set value "front"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.target_offset set value "south"
execute if data entity @s data.vexp{target_type:"door",target_offset:"south"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.door_mount set value "front"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.target_offset set value "north"
execute if data entity @s data.vexp{target_type:"door",target_offset:"north"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.door_mount set value "back"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.target_offset set value "north"
execute if data entity @s data.vexp{target_type:"door",target_offset:"north"} if entity @s[y_rotation=-45..45] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.door_mount set value "back"

# Mirando al este (yaw 45..135)
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=45..135] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=west] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=45..135] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=west] run data modify entity @s data.vexp.target_offset set value "west"
execute if data entity @s data.vexp{target_type:"door",target_offset:"west"} if entity @s[y_rotation=45..135] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=west] run data modify entity @s data.vexp.door_mount set value "front"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=45..135] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=west] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=45..135] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=west] run data modify entity @s data.vexp.target_offset set value "west"
execute if data entity @s data.vexp{target_type:"door",target_offset:"west"} if entity @s[y_rotation=45..135] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=west] run data modify entity @s data.vexp.door_mount set value "front"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=45..135] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=east] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=45..135] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=east] run data modify entity @s data.vexp.target_offset set value "east"
execute if data entity @s data.vexp{target_type:"door",target_offset:"east"} if entity @s[y_rotation=45..135] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=east] run data modify entity @s data.vexp.door_mount set value "back"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=45..135] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=east] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=45..135] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=east] run data modify entity @s data.vexp.target_offset set value "east"
execute if data entity @s data.vexp{target_type:"door",target_offset:"east"} if entity @s[y_rotation=45..135] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=east] run data modify entity @s data.vexp.door_mount set value "back"

# Mirando al oeste (yaw -135..-45)
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=east] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=east] run data modify entity @s data.vexp.target_offset set value "east"
execute if data entity @s data.vexp{target_type:"door",target_offset:"east"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=east] run data modify entity @s data.vexp.door_mount set value "front"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=east] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=east] run data modify entity @s data.vexp.target_offset set value "east"
execute if data entity @s data.vexp{target_type:"door",target_offset:"east"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=east] run data modify entity @s data.vexp.door_mount set value "front"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=west] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=west] run data modify entity @s data.vexp.target_offset set value "west"
execute if data entity @s data.vexp{target_type:"door",target_offset:"west"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=west] run data modify entity @s data.vexp.door_mount set value "back"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=west] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=west] run data modify entity @s data.vexp.target_offset set value "west"
execute if data entity @s data.vexp{target_type:"door",target_offset:"west"} if entity @s[y_rotation=-135..-45] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=west] run data modify entity @s data.vexp.door_mount set value "back"

# Mirando al norte (yaw 136..180 o -180..-136)
execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=136..180] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=136..180] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.target_offset set value "north"
execute if data entity @s data.vexp{target_type:"door",target_offset:"north"} if entity @s[y_rotation=136..180] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.door_mount set value "front"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=136..180] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=136..180] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.target_offset set value "north"
execute if data entity @s data.vexp{target_type:"door",target_offset:"north"} if entity @s[y_rotation=136..180] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.door_mount set value "front"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=136..180] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=136..180] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.target_offset set value "south"
execute if data entity @s data.vexp{target_type:"door",target_offset:"south"} if entity @s[y_rotation=136..180] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.door_mount set value "back"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=136..180] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=136..180] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.target_offset set value "south"
execute if data entity @s data.vexp{target_type:"door",target_offset:"south"} if entity @s[y_rotation=136..180] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.door_mount set value "back"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-180..-136] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=-180..-136] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.target_offset set value "north"
execute if data entity @s data.vexp{target_type:"door",target_offset:"north"} if entity @s[y_rotation=-180..-136] positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.door_mount set value "front"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-180..-136] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=-180..-136] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.target_offset set value "north"
execute if data entity @s data.vexp{target_type:"door",target_offset:"north"} if entity @s[y_rotation=-180..-136] positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[facing=north] run data modify entity @s data.vexp.door_mount set value "front"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-180..-136] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=-180..-136] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.target_offset set value "south"
execute if data entity @s data.vexp{target_type:"door",target_offset:"south"} if entity @s[y_rotation=-180..-136] positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.door_mount set value "back"

execute if data entity @s data.vexp{target_type:"none"} if entity @s[y_rotation=-180..-136] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.target_type set value "door"
execute if data entity @s data.vexp{target_type:"door",target_offset:"none"} if entity @s[y_rotation=-180..-136] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.target_offset set value "south"
execute if data entity @s data.vexp{target_type:"door",target_offset:"south"} if entity @s[y_rotation=-180..-136] positioned ^ ^ ^1 if block ~ ~-1 ~ #minecraft:doors[facing=south] run data modify entity @s data.vexp.door_mount set value "back"
