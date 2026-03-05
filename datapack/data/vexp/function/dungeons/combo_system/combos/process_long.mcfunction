# Long combo: 5 hits
scoreboard players add @s vexp.combo 1
execute if score @s vexp.combo matches 5.. run tag @s add vexp.combo_end
