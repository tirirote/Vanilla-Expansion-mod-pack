# dungeons/bow/arrows/types/common/on_hit_block.mcfunction
# @s is a common-quality bow arrow

execute positioned ^ ^ ^0.2 run function vexp:utils/feedback/block_hit
