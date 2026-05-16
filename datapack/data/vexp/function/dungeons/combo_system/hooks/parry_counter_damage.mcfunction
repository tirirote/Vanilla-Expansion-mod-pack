# dungeons/combo_system/hooks/parry_counter_damage.mcfunction
# Macro: applies weapon damage to the parried entity, attributed to the parrying player.
# Called from apply_parry_wrapper with storage vexp:temp parry_counter {damage:<float>}
# @s context: the parrying player (tagged vexp.parry_counter_attacker)
$execute as @e[tag=vexp.parried,limit=1] run damage @s $(damage) vexp:combo_hit by @p[tag=vexp.parry_counter_attacker,limit=1]
