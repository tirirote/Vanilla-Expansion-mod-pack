# Call macro to summon indicator
execute if score #damage_raw vexp.math matches 1.. store result storage vexp:temp Damage.val int 0.01 run scoreboard players get #damage vexp.math
execute positioned ^-0.75 ^.5 ^0.5 run function vexp:mob_health/summon_damage_indicator with storage vexp:temp Damage
