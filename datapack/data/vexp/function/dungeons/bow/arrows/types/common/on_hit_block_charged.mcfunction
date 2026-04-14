# dungeons/bow/arrows/types/common/on_hit_block_charged.mcfunction
# @s is a common-quality bow arrow, tier 3 (charged), hitting a block
# Extra block impact effects for tier 3

execute positioned ^ ^ ^0.2 run function vexp:utils/feedback/block_hit
particle minecraft:crit ~ ~ ~ 0.2 0.2 0.2 0.03 8
