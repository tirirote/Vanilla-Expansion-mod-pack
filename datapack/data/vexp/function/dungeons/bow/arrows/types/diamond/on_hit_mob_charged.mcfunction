# dungeons/bow/arrows/types/diamond/on_hit_mob_charged.mcfunction
# @s is a diamond-quality bow arrow, fully charged, hitting a mob

execute as @p[tag=vexp.arrow.owner,limit=1] run function vexp:dungeons/states/diamond_buffed
function vexp:utils/hits/diamond_hit
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
