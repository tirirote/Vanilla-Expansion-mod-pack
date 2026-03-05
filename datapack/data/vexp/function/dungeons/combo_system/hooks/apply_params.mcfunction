# dungeons/combo_system/hooks/apply_params.mcfunction

# Assign cooldown from item params
$scoreboard players set @s vexp.combo_cooldown $(cooldown)

# 2. Assign vexp.attacker to current player
tag @s add vexp.attacker

# Generic damage based on item params (Assigns vexp.hitted to nearest mob)
# damage_aoe will now handle finding the hitbox itself
function vexp:dungeons/combo_system/hitbox/damage_aoe with storage vexp:main combo_params

# Process combos and hooks for the hitted entity
function vexp:dungeons/combo_system/hooks/handle_hit with storage vexp:main combo_params

# Feedback
playsound minecraft:entity.player.attack.sweep player @s ~ ~ ~ 1 1

# TAGS are now removed globally in dungeons/tick.mcfunction to allow feedback systems to process them