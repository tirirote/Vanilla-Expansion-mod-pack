# dungeons/handgun/on_hit.mcfunction
# @s is the hit target (assigned by combo_system)

function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Consumo de bala si el jugador tiene munición
execute as @p[tag=vexp.handgun.owner,tag=vexp.attacker,limit=1] store result score #handgun_inventory_ammo vexp.math run clear @s minecraft:poisonous_potato[custom_data~{vexp:{type:"handgun_ammo"}}] 0
execute if score #handgun_inventory_ammo vexp.math matches 1.. as @p[tag=vexp.handgun.owner,tag=vexp.attacker,limit=1] run function vexp:dungeons/handgun/consume

# Feedback ligero por impacto de bala dentro del pipeline de combos.
particle minecraft:flame ~ ~1 ~ 0.05 0.05 0.05 0.01 3
particle large_smoke ~ ~1 ~ 0.1 0.1 0.1 0.05 3
function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.twinkle", type: "player"}
