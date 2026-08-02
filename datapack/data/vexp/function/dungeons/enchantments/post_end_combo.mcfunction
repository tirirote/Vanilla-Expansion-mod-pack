# Bridge principal de encantamientos al terminar combo (finisher).
# @s es el jugador atacante del combo.

# Solo aplicar hooks si hubo al menos una entidad impactada en este finisher.
execute unless entity @e[tag=vexp.hitted,distance=..16,limit=1] run return 0

# Encantamientos vanilla bridge.
function vexp:dungeons/enchantments/vanilla/post_end_combo

# Encantamientos custom bridge.
function vexp:dungeons/enchantments/custom/post_end_combo
