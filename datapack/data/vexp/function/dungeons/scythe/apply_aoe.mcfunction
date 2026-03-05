# dungeons/scythe/apply_aoe.mcfunction
# @s is a target candidate (multiple hits possible)

# 1. Damage them
damage @s 5 minecraft:player_attack by @p[tag=vexp.attacker,limit=1]

# 2. Slight push away
function vexp:utils/motion/apply_knockback {strength:1, y:0.25}

# 3. Visuals
particle minecraft:cloud ~ ~1.2 ~ 0.1 0.1 0.1 0.05 3
