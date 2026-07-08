# on_interact.mcfunction
# Ejecutar AS la interaction de la trapdoor.

execute unless entity @s[tag=vexp.trapdoor_opened] unless entity @s[tag=vexp.close_trapdoor_anim] run function vexp:custom_block/blocks/trapdoor/open
execute if entity @s[tag=vexp.trapdoor_opened] unless entity @s[tag=vexp.open_trapdoor_anim] run function vexp:custom_block/blocks/trapdoor/close
