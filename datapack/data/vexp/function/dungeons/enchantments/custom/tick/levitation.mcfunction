# Tag levitation player
execute if entity @s[predicate=vexp:is_airborne_sneaking,predicate=vexp:full_saturation] run tag @s add vexp.enchantment_try_to_levitate

#Force timmer
execute if entity @s[tag=vexp.enchantment_try_to_levitate] run scoreboard players add @s vexp.enchant.levitation_time 1

execute if entity @s[tag=vexp.enchantment_try_to_levitate] if score @s vexp.enchant.levitation_time matches 1..5 if score @s vexp.enchant.levitation matches 1 run effect give @s levitation 1 2 true
execute if entity @s[tag=vexp.enchantment_try_to_levitate] if score @s vexp.enchant.levitation_time matches 1..5 if score @s vexp.enchant.levitation matches 2.. run effect give @s levitation 1 3 true

execute if entity @s[tag=vexp.enchantment_try_to_levitate] if score @s vexp.enchant.levitation_time matches 5.. if score @s vexp.enchant.levitation matches 1 run effect give @s slow_falling 2 0 true
execute if entity @s[tag=vexp.enchantment_try_to_levitate] if score @s vexp.enchant.levitation_time matches 5.. if score @s vexp.enchant.levitation matches 2.. run effect give @s slow_falling 2 0 true

# Feedback
execute if entity @s[tag=vexp.enchantment_try_to_levitate] if score @s vexp.enchant.levitation_time matches 1 run particle instant_effect{color:15519999,power:2} ~ ~ ~ 0.5 0 0.5 1 15
execute if entity @s[tag=vexp.enchantment_try_to_levitate] if score @s vexp.enchant.levitation_time matches 1 run particle dust_color_transition{from_color:15519999,to_color:9204479,scale:2.1} ~ ~-0.5 ~ 0.5 0 0.5 1 15

execute if entity @s[tag=vexp.enchantment_try_to_levitate] if score @s vexp.enchant.levitation_time matches 1 run function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}
execute if entity @s[tag=vexp.enchantment_try_to_levitate] if score @s vexp.enchant.levitation_time matches 1 run function vexp:utils/sound {sound: "minecraft:entity.shulker_bullet.hit", type: "player", pitch:1}

execute if entity @s[tag=vexp.enchantment_try_to_levitate] run particle effect{color:15519999,power:0.5} ~ ~-0.25 ~ 0.2 0.1 0.2 1 1

# Cleanup
execute unless entity @s[tag=vexp.enchantment_try_to_levitate] run effect clear @s levitation
execute unless entity @s[tag=vexp.enchantment_try_to_levitate] run effect clear @s slow_falling
execute unless entity @s[predicate=vexp:is_airborne_sneaking,predicate=vexp:full_saturation] unless block ~ ~-0.5 ~ #replaceable run scoreboard players set @s vexp.enchant.levitation_time 0

tag @s remove vexp.enchantment_try_to_levitate
