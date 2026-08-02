# Sword on special hit hook
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.05}

# Aeo Wave Feedback
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ run particle sweep_attack ^ ^ ^1 1 1 1 1 0
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^3 run function vexp:dungeons/fx/aeo_waves/common
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^4 run function vexp:dungeons/fx/aeo_waves/common
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^5 run function vexp:dungeons/fx/aeo_waves/common
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^6 run function vexp:dungeons/fx/aeo_waves/common

function vexp:utils/sound {sound: "minecraft:entity.wind_charge.wind_burst", type: "player", pitch:1}

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit

# Remove tag
execute as @p[tag=vexp.attacker,limit=1] if entity @s[tag=vexp.hitted.special] run tag @s remove vexp.hitted.special
