# dungeons/rapier/echo/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Double damage
data modify storage vexp:temp damage set value 4.0
execute as @e[tag=vexp.hitted] run function vexp:utils/apply_player_attack_damage with storage vexp:temp

# Mob effects
execute as @e[tag=vexp.hitted] run effect give @s minecraft:slowness 2 2 true
execute as @e[tag=vexp.hitted] run effect give @s minecraft:blindness 2 0 true

# Recoil and Speed for player
execute at @s run function vexp:utils/motion/apply_motion_by_player {player:"@p", distance:1.2, scale:-0.2}
effect give @s minecraft:speed 2 1 true
