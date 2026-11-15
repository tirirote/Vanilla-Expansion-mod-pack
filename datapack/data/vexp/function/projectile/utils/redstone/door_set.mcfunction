$setblock ~ ~ ~ $(block)[half=lower,facing=$(facing),hinge=$(hinge),open=$(open),powered=$(powered)]
$execute if block ~ ~1 ~ $(block)[half=upper] run setblock ~ ~1 ~ $(block)[half=upper,facing=$(facing),hinge=$(hinge),open=$(open),powered=$(powered)]
