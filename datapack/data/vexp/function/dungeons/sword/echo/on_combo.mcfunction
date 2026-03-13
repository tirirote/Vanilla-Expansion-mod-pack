# dungeons/sword/echo/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Double damage (applying it again basically)
data modify storage vexp:temp damage set value 6.0
execute as @e[tag=vexp.hitted] run function vexp:utils/apply_player_attack_damage with storage vexp:temp

# Knockback {strength:-3.5, y:0.25} -> Pull
data modify storage vexp:temp motion set value {strength:-3.5, y:0.25}
execute as @e[tag=vexp.hitted] at @s run function vexp:utils/motion/apply_knockback with storage vexp:temp motion

