execute if score @s vexp.proj_lifetime matches 9.. run particle electric_spark ~ ~ ~ 1 0 1 0.5 45
execute if score @s vexp.proj_lifetime matches 5..8 run particle electric_spark ~ ~ ~ 0.75 0 0.75 0.35 30
execute if score @s vexp.proj_lifetime matches 3..5 run particle electric_spark ~ ~ ~ 0.5 0 0.5 0.25 20
execute if score @s vexp.proj_lifetime matches 1..2 run particle electric_spark ~ ~ ~ 0.25 0 0.25 0.1 10

particle scrape ~ ~ ~ 0.5 0.1 0.5 1 1
particle ominous_spawning ~ ~ ~ 0.5 0.1 0.5 1 3
