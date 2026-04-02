# dungeons/gauntlets/parry_success.mcfunction
# @s is the player who parried successfully

# Default configurable parry damage
data modify storage vexp:dungeons.weapon parry_params set value {damage:1}

# Push nearby mobs away from the player
# Reuse existing knockback utility that expects a tagged attacker.
tag @s add vexp.attacker
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..2.5,sort=nearest] at @s run function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.25}

# Quality-specific parry hook
function vexp:dungeons/gauntlets/route_on_parry

tag @s remove vexp.attacker
data remove storage vexp:dungeons.weapon parry_params


# End parry state and grant brief speed boost
tag @s remove vexp.gauntlets.parry
scoreboard players set @s vexp.gauntlets_parry_timer 0
scoreboard players set @s vexp.gauntlets_boost_timer 20

# Feedback
function vexp:utils/sound {sound: "minecraft:item.shield.block", type: "player"}
