# dungeons/armor/tick.mcfunction

# Armor related cleanup
execute as @a[tag=vexp.armor_equip] run team leave @s
execute as @a[tag=vexp.armor_equip] run tag @s remove vexp.armor_equip

# Type specific cleanup
execute as @e[tag=vexp.bone_modifier] unless entity @p[tag=vexp.armor_equip,distance=..16] run function vexp:dungeons/armor/types/bone/target_clear
execute as @e[tag=vexp.emerald_illager_mod] unless entity @p[tag=vexp.armor_equip,distance=..16] run function vexp:dungeons/armor/types/emerald/illagers_mod_clear

# Evaluate armor hooks per player
execute as @a run function vexp:dungeons/armor/process_player
