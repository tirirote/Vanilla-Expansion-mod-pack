# dungeons/combo_system/display_skill_cooldown.mcfunction
# Visual representation of skill cooldown using actionbar.

# Update display combo cooldown in seconds with one decimal (truncated): ticks / 20.0
scoreboard players operation @s vexp.cooldown_tenths = @s vexp.skill_cooldown

scoreboard players operation @s vexp.cooldown_tenths *= #const_ten vexp.math
scoreboard players operation @s vexp.cooldown_tenths /= #const_twenty vexp.math
scoreboard players operation @s vexp.cooldown_sec_int = @s vexp.cooldown_tenths
scoreboard players operation @s vexp.cooldown_sec_int /= #const_ten vexp.math
scoreboard players operation @s vexp.cooldown_sec_dec = @s vexp.cooldown_tenths
scoreboard players operation @s vexp.cooldown_sec_dec %= #const_ten vexp.math

# Cooldown Display
execute if score @s vexp.skill_cooldown matches 1.. run function vexp:dungeons/combo_system/cooldown_display_bar
execute if score @s vexp.skill_cooldown matches ..1 run title @s actionbar [{"text":""}]
