# Cooldown and other score windows management
# 1. Combo cooldown
execute if score @s vexp.combo_cooldown matches 1.. run scoreboard players remove @s vexp.combo_cooldown 1
execute if score @s vexp.combo_cooldown matches 1.. run function vexp:dungeons/combo_system/display_combo_cooldown

# 2. Skill cooldown
execute if score @s vexp.skill_cooldown matches 1.. run scoreboard players remove @s vexp.skill_cooldown 1
execute if score @s vexp.skill_cooldown matches 1.. run function vexp:dungeons/combo_system/display_skill_cooldown

# 3. Hitbox hide timmer
execute if score @s vexp.hitbox_hide_timer matches 1.. run scoreboard players remove @s vexp.hitbox_hide_timer 1

# 4. Special hit window for player
execute if entity @s[tag=vexp.hitted.special] if score @s vexp.special_hit_window matches 1.. run scoreboard players remove @s vexp.special_hit_window 1
execute if entity @s[tag=vexp.hitted.special] if score @s vexp.special_hit_window matches 0 run scoreboard players set @s vexp.combo 0
execute if entity @s[tag=vexp.hitted.special] if score @s vexp.special_hit_window matches 0 run tag @s remove vexp.hitted.special

# 5. Combo time window
execute if score @s vexp.combo_time_window matches 0 run scoreboard players set @s vexp.combo 0
execute if score @s vexp.combo_time_window matches 1.. run scoreboard players remove @s vexp.combo_time_window 1
