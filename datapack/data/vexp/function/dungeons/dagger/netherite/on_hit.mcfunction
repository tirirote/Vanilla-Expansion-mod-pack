# Netherite Dagger On Hit Effects
function vexp:dungeons/states/nether_marked

# Apply knockback to mob
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}

particle lava ~ ~1 ~ .1 .1 .1 0 1
function vexp:utils/sound {sound: "item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
