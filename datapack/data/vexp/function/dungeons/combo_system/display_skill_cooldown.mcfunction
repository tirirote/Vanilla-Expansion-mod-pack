# dungeons/combo_system/display_skill_cooldown.mcfunction
# Visual representation of skill cooldown using actionbar.

# Update display combo cooldown in seconds with one decimal (truncated): ticks / 20.0
execute store result score #cooldown_ticks vexp.math run scoreboard players get @s vexp.skill_cooldown

scoreboard players operation #cooldown_tenths vexp.math = #cooldown_ticks vexp.math
scoreboard players operation #cooldown_tenths vexp.math *= #const_ten vexp.math
scoreboard players operation #cooldown_tenths vexp.math /= #const_twenty vexp.math
scoreboard players operation #cooldown_sec_int vexp.math = #cooldown_tenths vexp.math
scoreboard players operation #cooldown_sec_int vexp.math /= #const_ten vexp.math
scoreboard players operation #cooldown_sec_dec vexp.math = #cooldown_tenths vexp.math
scoreboard players operation #cooldown_sec_dec vexp.math %= #const_ten vexp.math

execute store result storage vexp:temp cooldown_display.cooldown_sec_int int 1 run scoreboard players get #cooldown_sec_int vexp.math
execute store result storage vexp:temp cooldown_display.cooldown_sec_dec int 1 run scoreboard players get #cooldown_sec_dec vexp.math
# Cooldown Display
execute if score @s vexp.skill_cooldown matches 1.. run function vexp:dungeons/combo_system/cooldown_display_bar with storage vexp:temp cooldown_display
execute if score @s vexp.skill_cooldown matches ..1 run title @s actionbar [{"text":""}]
