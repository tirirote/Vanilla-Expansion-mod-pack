# Echo projectile hook on entity hit
execute as @e[tag=vexp.proj_target,tag=vexp.echo_marked,sort=nearest] at @s run tp @p[tag=vexp.projectile_owner,limit=1] ^ ^.25 ^-1.5 facing entity @s feet

execute as @e[tag=vexp.proj_target] run function vexp:dungeons/states/echo_marked
# AoE wave
particle minecraft:large_smoke ~ ~1 ~ 0.5 0.2 0.5 0.1 10

particle minecraft:sculk_charge_pop ~ ~1 ~ 0.5 0.2 0.5 0.05 10
particle sonic_boom ~ ~1 ~ 0 0 0 0 1
function vexp:utils/sound {sound: "minecraft:entity.warden.sonic_boom", type: "player"}

execute as @e[tag=vexp.proj_target] run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

