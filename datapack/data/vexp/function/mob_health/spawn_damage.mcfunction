# Prep damage data in storage
execute store result storage vexp:temp Damage.val int 1 run scoreboard players get #damage vexp.math

# Call macro to summon indicator
execute if entity @s[tag=vexp.custom_block.dummy] positioned ^0.5 ^-0.5 ^ run function vexp:mob_health/summon_damage_indicator with storage vexp:temp Damage
execute unless entity @s[tag=vexp.custom_block.dummy] positioned ^-0.5 ^.5 ^ run function vexp:mob_health/summon_damage_indicator with storage vexp:temp Damage
