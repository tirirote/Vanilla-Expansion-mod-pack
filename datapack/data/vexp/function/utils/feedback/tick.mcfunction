# Custom swoosh
execute as @e[type=item_display,tag=vexp.swoosh] at @s run function vexp:utils/feedback/swoosh/tick
execute as @e[type=armor_stand,tag=vexp.swoosh_light] at @s run function vexp:utils/feedback/swoosh/light_tick
