# dungeons/handgun/on_combo.mcfunction
# @s is a target tagged as vexp.hitted.combo_end by combo_system

# Finisher: explosión ligera de impacto al completar combo.
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.1}

# Consumo de bala si el jugador tiene munición
execute as @p[tag=vexp.handgun.owner,tag=vexp.attacker,limit=1] store result score #handgun_inventory_ammo vexp.math run clear @s minecraft:poisonous_potato[custom_data~{vexp:{type:"handgun_ammo"}}] 0
execute if score #handgun_inventory_ammo vexp.math matches 1.. as @p[tag=vexp.handgun.owner,tag=vexp.attacker,limit=1] run function vexp:dungeons/handgun/consume

particle minecraft:explosion ~ ~1 ~ 0 0 0 0.01 1
particle minecraft:large_smoke ~ ~1 ~ 0.1 0.1 0.1 0.05 3
particle lava ~ ~1 ~ 0.2 0.2 0.2 0.01 1
function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.large_blast", type: "player"}
