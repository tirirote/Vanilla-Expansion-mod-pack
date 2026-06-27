# Spear RC
# @s is the player

# Tag player
tag @s add vexp.attacker

#Buff Player
function vexp:dungeons/states/nether_buffed

# Aeo Wave Feedback
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ positioned ^ ^ ^5 run function vexp:dungeons/fx/aeo_waves/netherite
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ positioned ^ ^ ^6 run function vexp:dungeons/fx/aeo_waves/netherite
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ positioned ^ ^ ^7 run function vexp:dungeons/fx/aeo_waves/netherite
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ positioned ^ ^ ^8 run function vexp:dungeons/fx/aeo_waves/netherite
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}

# Feedback
execute positioned ^ ^ ^3.5 if entity @e[predicate=vexp:is_target,distance=..3.5] run function vexp:dungeons/fx/hits/netherite_hit

# Dash damage and knockback
execute positioned ^ ^ ^3.5 as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:dungeons/weapons/spear/dash_damage {damage: 5}
execute positioned ^ ^ ^3.5 as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:utils/motion/apply_knockback {strength:-4.5, y:0.1}


#Player Dash
function vexp:dungeons/weapons/spear/dash
