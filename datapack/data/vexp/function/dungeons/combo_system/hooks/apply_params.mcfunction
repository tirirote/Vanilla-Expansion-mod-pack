# dungeons/combo_system/hooks/apply_params.mcfunction

# Assign cooldown from item params (effect-adjusted)
$scoreboard players set @s vexp.combo_cooldown $(eff_cooldown)

# 2. Assign vexp.attacker to current player
tag @s add vexp.attacker

# Generic damage based on item params (Assigns vexp.hitted to nearest mob)
# damage_aoe will now handle finding the hitbox itself
function vexp:dungeons/combo_system/hitbox/damage_aoe with storage vexp:dungeons.weapon combo_params

# Process combos and hooks for the hitted entity
function vexp:dungeons/combo_system/hooks/handle_hit with storage vexp:dungeons.weapon combo_params

#Visual feedback (Swoosh)
execute positioned ~ ~1.5 ~ run particle sweep_attack ^ ^ ^1.25 0.1 0.2 0.1 0 3

function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
