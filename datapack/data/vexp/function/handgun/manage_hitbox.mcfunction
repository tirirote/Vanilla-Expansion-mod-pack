execute unless entity @e[type=interaction,tag=vexp.gun_hitbox,distance=..3] run summon interaction ^ ^ ^1.25 {Tags:["vexp.gun_hitbox"],width:0.5f,height:0.5f}

tp @e[type=interaction,tag=vexp.gun_hitbox,distance=..3,limit=1,sort=nearest] ^ ^ ^1.25

#Click izquierdo disparo
execute positioned ^ ^ ^1.25 if data entity @e[type=interaction,tag=vexp.gun_hitbox,distance=..3,limit=1,sort=nearest] attack run function vexp:handgun/on_use
data remove entity @e[type=interaction,tag=vexp.gun_hitbox,distance=..3,limit=1,sort=nearest] attack

#Click derecho recargar
execute positioned ^ ^ ^1.25 if data entity @e[type=interaction,tag=vexp.gun_hitbox,distance=..3,limit=1,sort=nearest] interaction run function vexp:handgun/reload/reload
data remove entity @e[type=interaction,tag=vexp.gun_hitbox,distance=..3,limit=1,sort=nearest] interaction
