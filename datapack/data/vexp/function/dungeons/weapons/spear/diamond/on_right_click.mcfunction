# Spear RC
# @s is the player

# Tag player
tag @s add vexp.attacker

# Cache owner ID for self-filter in target queries.
scoreboard players operation #combo_owner_id vexp.id = @s vexp.id

# Buff Player
function vexp:dungeons/states/diamond_buffed

# Aeo Wave Feedback
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ positioned ^ ^ ^5 run function vexp:dungeons/fx/aeo_waves/diamond
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ positioned ^ ^ ^6 run function vexp:dungeons/fx/aeo_waves/diamond
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ positioned ^ ^ ^7 run function vexp:dungeons/fx/aeo_waves/diamond
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ positioned ^ ^ ^8 run function vexp:dungeons/fx/aeo_waves/diamond
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}

# Feedback
execute positioned ^ ^ ^3.5 if entity @e[predicate=vexp:is_target,distance=..3.5] unless score @s vexp.id = #combo_owner_id vexp.id at @s run function vexp:dungeons/fx/hits/diamond_hit

# Dash damage and knockback
execute positioned ^ ^ ^3.5 as @e[predicate=vexp:is_target,distance=..3.5] unless score @s vexp.id = #combo_owner_id vexp.id at @s run function vexp:dungeons/weapons/spear/dash_damage {damage: 4}
execute positioned ^ ^ ^3.5 as @e[predicate=vexp:is_target,distance=..3.5] unless score @s vexp.id = #combo_owner_id vexp.id at @s run function vexp:utils/motion/apply_knockback {strength:-4.5, y:0.1}

#Player Dash
function vexp:dungeons/weapons/spear/dash
