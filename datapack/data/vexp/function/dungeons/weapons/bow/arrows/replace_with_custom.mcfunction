# dungeons/bow/arrows/replace_with_custom.mcfunction
# @s is the original vanilla arrow spawned by bow shot.
# Extract Motion, normalize it to unit length, store it for per-tick reapplication.

# Tag the vanilla arrow as custom bow arrow.
tag @s add vexp.bow_arrow
tag @s add vexp.custom_bow_arrow

# Ensure arrow has an id for probe linking.
execute unless score @s vexp.id = @s vexp.id run function vexp:utils/assign_id

# Spawn persistent hit probe marker linked by vexp.id.
summon minecraft:marker ~ ~ ~ {Tags:["vexp.bow_probe","vexp.bow_probe.new"]}
scoreboard players operation @e[type=minecraft:marker,tag=vexp.bow_probe.new,sort=nearest,limit=1,distance=..1] vexp.id = @s vexp.id
scoreboard players set @e[type=minecraft:marker,tag=vexp.bow_probe.new,sort=nearest,limit=1,distance=..1] vexp.timer 8
tag @e[type=minecraft:marker,tag=vexp.bow_probe.new,sort=nearest,limit=1,distance=..1] remove vexp.bow_probe.new

# Store original motion temporarily to normalize it.
data modify storage vexp:temp arrow_motion set from entity @s Motion

data modify entity @s NoGravity set value 0b

# Normalize motion and store as unit vector in arrow's custom_data.
# This function will compute the magnitude and divide each component.
function vexp:dungeons/weapons/bow/arrows/normalize_motion
