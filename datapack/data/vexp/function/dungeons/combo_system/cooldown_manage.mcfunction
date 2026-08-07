# Manage Cooldown
execute if score @s vexp.skill_cooldown matches 1.. run function vexp:dungeons/combo_system/display_skill_cooldown
execute if score @s vexp.combo_cooldown matches 1.. run function vexp:dungeons/combo_system/display_combo_cooldown
execute if score @s vexp.combo_cooldown matches 1.. run scoreboard players remove @s vexp.combo_cooldown 1
execute if score @s vexp.skill_cooldown matches 1.. run scoreboard players remove @s vexp.skill_cooldown 1
execute if score @s vexp.hitbox_hide_timer matches 1.. run scoreboard players remove @s vexp.hitbox_hide_timer 1
