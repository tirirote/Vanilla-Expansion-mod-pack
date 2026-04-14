# Constant-speed custom arrow motion.
execute as @e[type=minecraft:arrow,tag=vexp.custom_bow_arrow,nbt={inGround:0b}] at @s run function vexp:dungeons/bow/arrows/custom_motion

# Sync probe markers with live arrows.
execute as @e[type=minecraft:arrow,tag=vexp.bow_arrow,nbt={inGround:0b}] at @s run function vexp:dungeons/bow/arrows/hooks/sync_probe

# 2) Per-tick hook for all custom bow arrows.
execute as @e[type=minecraft:arrow,tag=vexp.bow_arrow,nbt={inGround:0b}] at @s run function vexp:dungeons/bow/arrows/hooks/on_tick

# 3) on_hit_mob hook (probe-based, survives arrow despawn on impact).
execute as @e[type=minecraft:marker,tag=vexp.bow_probe,tag=!vexp.arrow.mob_hit_called] at @s run function vexp:dungeons/bow/arrows/hooks/detect_hit_mob

# 4) on_hit_block hook (once when arrow gets embedded).
execute as @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=!vexp.arrow.block_hit_called,nbt={inGround:1b}] at @s run function vexp:dungeons/bow/arrows/hooks/on_hit_block
tag @e[type=minecraft:arrow,tag=vexp.bow_arrow,tag=!vexp.arrow.block_hit_called,nbt={inGround:1b}] add vexp.arrow.block_hit_called
