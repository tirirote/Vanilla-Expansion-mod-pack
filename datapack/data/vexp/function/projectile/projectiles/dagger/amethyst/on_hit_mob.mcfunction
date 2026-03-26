# Amethyst projectile hook on entity hit
execute as @e[tag=vexp.proj_target,limit=1] run effect give @s minecraft:levitation 2 1 true
execute as @e[tag=vexp.proj_target,limit=1] run effect give @s minecraft:slowness 2 1 true
execute as @e[tag=vexp.proj_target,limit=1,nbt={active_effects:[{id:"minecraft:levitation"}]}] run function vexp:dungeons/states/amethyst_fragmentation
