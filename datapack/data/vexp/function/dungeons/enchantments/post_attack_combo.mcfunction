# Bridge principal de encantamientos para combo_system.
# @s es el jugador atacante del combo.

# Solo aplicar hooks si hubo al menos una entidad impactada en este golpe.
execute unless entity @e[tag=vexp.hitted,distance=..8,limit=1] run return 0

# Encantamientos vanilla bridge.
function vexp:dungeons/enchantments/vanilla/post_attack_combo

# Encantamientos custom bridge.
function vexp:dungeons/enchantments/custom/post_attack_combo
