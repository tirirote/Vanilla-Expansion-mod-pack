# Apply damage to the hitted entity (effect-adjusted)
$execute as @e[tag=vexp.hitted] store success score @s vexp.hit_success run damage @s $(eff_damage) vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
