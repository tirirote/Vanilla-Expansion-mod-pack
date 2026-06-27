# Handle on right click hold
# @s is the player
execute if score @s vexp.skill_cooldown matches 0 run tag @s add vexp.skill_hold_active
execute if score @s vexp.skill_cooldown matches 0 run scoreboard players add @s vexp.skill_hold_time 1

#On hold hook
execute if score @s vexp.skill_cooldown matches 0 if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/route_on_right_click_hold with storage vexp:dungeons.weapon combo_params

#Hold Ready
execute if score @s vexp.skill_cooldown matches 0 if score @s vexp.skill_hold_time matches 8.. run tag @s add vexp.skill_hold_ready
