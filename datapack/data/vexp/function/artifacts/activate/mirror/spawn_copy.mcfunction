# Spawn mannequin clone
$summon mannequin ~ ~ ~ {profile:{id:$(UUID)},Tags:["vexp.mirror_clone","vexp.mirror_clone_new"],Glowing:true,hide_description:true,Health:100}
execute as @e[tag=vexp.mirror_clone_new,distance=..6,limit=1] run team join vexp.blue
execute as @e[tag=vexp.mirror_clone_new,distance=..6,limit=1] at @s as @e[predicate=vexp:is_target,type=!player,distance=..12] run damage @s 0.1 generic by @e[tag=vexp.mirror_clone_new,distance=..6,sort=nearest,limit=1]
tag @e[tag=vexp.mirror_clone_new,distance=..6,limit=1] remove vexp.mirror_clone_new
