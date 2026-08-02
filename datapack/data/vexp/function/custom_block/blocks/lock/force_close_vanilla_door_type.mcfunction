# Macro: cerrar una puerta de tipo $(door) conservando facing y hinge.
# Called with storage vexp:custom_block lock_force_close {door:"minecraft:oak_door"}

$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=north,hinge=left] run setblock ~ ~ ~ $(door)[half=lower,open=false,facing=north,hinge=left]
$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=north,hinge=left] run setblock ~ ~1 ~ $(door)[half=upper,open=false,hinge=left]
$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=north,hinge=right] run setblock ~ ~ ~ $(door)[half=lower,open=false,facing=north,hinge=right]
$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=north,hinge=right] run setblock ~ ~1 ~ $(door)[half=upper,open=false,hinge=right]

$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=south,hinge=left] run setblock ~ ~ ~ $(door)[half=lower,open=false,facing=south,hinge=left]
$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=south,hinge=left] run setblock ~ ~1 ~ $(door)[half=upper,open=false,hinge=left]
$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=south,hinge=right] run setblock ~ ~ ~ $(door)[half=lower,open=false,facing=south,hinge=right]
$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=south,hinge=right] run setblock ~ ~1 ~ $(door)[half=upper,open=false,hinge=right]

$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=east,hinge=left] run setblock ~ ~ ~ $(door)[half=lower,open=false,facing=east,hinge=left]
$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=east,hinge=left] run setblock ~ ~1 ~ $(door)[half=upper,open=false,hinge=left]
$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=east,hinge=right] run setblock ~ ~ ~ $(door)[half=lower,open=false,facing=east,hinge=right]
$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=east,hinge=right] run setblock ~ ~1 ~ $(door)[half=upper,open=false,hinge=right]

$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=west,hinge=left] run setblock ~ ~ ~ $(door)[half=lower,open=false,facing=west,hinge=left]
$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=west,hinge=left] run setblock ~ ~1 ~ $(door)[half=upper,open=false,hinge=left]
$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=west,hinge=right] run setblock ~ ~ ~ $(door)[half=lower,open=false,facing=west,hinge=right]
$execute if block ~ ~ ~ $(door)[half=lower,open=true,facing=west,hinge=right] run setblock ~ ~1 ~ $(door)[half=upper,open=false,hinge=right]
