# Mid combo: 3 hits
scoreboard players add @s vexp.combo 1
execute if score @s vexp.combo matches 3.. run tag @s add vexp.combo_end
