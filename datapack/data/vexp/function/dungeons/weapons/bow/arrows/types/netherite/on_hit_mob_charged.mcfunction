# dungeons/bow/arrows/types/netherite/on_hit_mob_charged.mcfunction
# @s is a netherite-quality bow arrow, fully charged, hitting a mob

#Buff Player
execute as @p[tag=vexp.arrow.owner,limit=1] run function vexp:dungeons/states/nether_buffed

#Mark the target
execute as @e[predicate=vexp:is_target,sort=nearest,limit=1,distance=..2] run function vexp:dungeons/states/nether_marked

#Netherite weapons hit particles
function vexp:dungeons/fx/hits/netherite_hit
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
