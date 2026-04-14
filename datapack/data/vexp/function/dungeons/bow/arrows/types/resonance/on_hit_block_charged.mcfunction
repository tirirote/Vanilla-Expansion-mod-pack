# dungeons/bow/arrows/types/resonance/on_hit_block_charged.mcfunction
# @s is a resonance-quality bow arrow, tier 3 (charged), hitting a block
# Extra block impact effects for tier 3

execute positioned ^ ^ ^0.2 run function vexp:utils/feedback/block_hit
particle minecraft:explosion ~ ~ ~ 0.3 0.3 0.3 0.05 4
particle minecraft:sculk_soul ~ ~ ~ 0.2 0.2 0.2 0.03 8
particle minecraft:sculk_charge_pop ~ ~ ~ 0.15 0.15 0.15 0.02 5
