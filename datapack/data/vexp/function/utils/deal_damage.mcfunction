# Deal custom damage + spawn damage indicator
tag @s add vexp.hitted
$execute as @e[tag=vexp.hitted] store success score @s vexp.hit_success run damage @s $(damage) $(type) by $(by)
execute as @e[tag=vexp.hitted] at @s run function vexp:mob_health/spawn_damage_on_hit
