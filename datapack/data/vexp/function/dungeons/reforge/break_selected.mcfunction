# Over-reforge protection: the weapon breaks if trying beyond 3 reforges.
item replace entity @s weapon.mainhand with minecraft:air
function vexp:utils/sound {sound:"minecraft:entity.item.break", type:"player", pitch:1}
function vexp:utils/sound {sound:"minecraft:block.vault.break", type:"player", pitch:1}
execute positioned ^ ^ ^1.5 run particle item{item:amethyst_shard} ~ ~1.4 ~ 0.25 0.25 0.25 0.1 5
execute positioned ^ ^ ^1.5 run particle smoke ~ ~1.4 ~ 0.0 0.0 0.0 0.1 1
