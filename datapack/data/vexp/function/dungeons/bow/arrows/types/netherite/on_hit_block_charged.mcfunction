# dungeons/bow/arrows/types/netherite/on_hit_block_charged.mcfunction
# @s is a netherite-quality bow arrow, tier 3 (charged), hitting a block
# Extra block impact effects for tier 3

execute positioned ^ ^ ^0.2 run function vexp:utils/feedback/block_hit
particle minecraft:explosion ~ ~ ~ 0.3 0.3 0.3 0.05 4
particle minecraft:flame ~ ~ ~ 0.2 0.2 0.2 0.03 8
particle minecraft:lava ~ ~ ~ 0.15 0.15 0.15 0.02 5
