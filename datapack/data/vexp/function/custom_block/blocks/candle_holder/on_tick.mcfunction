# on_tick.mcfunction
# Se ejecuta AS la interaction del candelabro.

# Particulas de vela encendida (solo cerca de jugadores)
execute store result score @s vexp.rand run random value 0..10
execute if score @s vexp.rand matches 1 if data entity @s data.vexp{candle_lit:1} if entity @p[distance=..24] run particle minecraft:small_flame ~ ~1.0 ~ 0.01 0.02 0.01 0 1
execute if score @s vexp.rand matches 1 if data entity @s data.vexp{candle_lit:1} if entity @p[distance=..24] run particle minecraft:smoke ~ ~1.02 ~ 0.01 0.02 0.01 0 1
