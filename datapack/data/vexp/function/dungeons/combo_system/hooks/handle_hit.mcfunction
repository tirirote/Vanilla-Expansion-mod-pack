# dungeons/combo_system/hooks/handle_hit.mcfunction
# @s is the player

# Custom hook for the hitted entity (On Hit Effect)
# Tag is already assigned in damage_aoe.mcfunction
execute as @e[tag=vexp.hitted] at @s positioned ~ ~1 ~ run function vexp:dungeons/combo_system/hitted_entity

# On hit function hook
$execute as @e[tag=vexp.hitted] at @s positioned ~ ~1 ~ run function vexp:dungeons/$(item)/on_hit

# Route to combo logic based on item type (adds vexp.combo_end if reached limit)
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"short_combo"}}] run function vexp:dungeons/combo_system/combos/process_short
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"mid_combo"}}] run function vexp:dungeons/combo_system/combos/process_mid
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"long_combo"}}] run function vexp:dungeons/combo_system/combos/process_long

# Trigger end combo immediately if tagged (Combo finisher)
execute if entity @s[tag=vexp.combo_end] run function vexp:dungeons/combo_system/hooks/end_combo with storage vexp:main combo_params
