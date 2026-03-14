# Tick tornado marker linked by owner vexp.id
scoreboard players operation #temp vexp.id = @s vexp.id

# Resolve owner for this marker
execute as @a if score @s vexp.id = #temp vexp.id run tag @s add vexp.current_tornado_owner

# If owner is gone, remove marker
execute unless entity @a[tag=vexp.current_tornado_owner,limit=1] run kill @s

# Orbit update (2 sub-steps per tick for smoother animation)
execute if entity @a[tag=vexp.current_tornado_owner,limit=1] run function vexp:dungeons/sword/netherite/tornado_orbit_step

# Damage nearby mobs around each tornado marker
execute at @s as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..2] run damage @s 1 minecraft:player_attack by @a[tag=vexp.current_tornado_owner,limit=1]

# Feedback
execute positioned ^.1 ^ ^ run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.4, 0.35, 0.3], scale: 2.1, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 1}
execute positioned ^-.1 ^ ^ run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.4, 0.35, 0.3], scale: 2.1, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 1}
particle flame ~ ~ ~ 0.1 0.1 0.1 0.05 1

# Lifetime
kill @s[scores={vexp.anim_frame=50..}]

# Cleanup temporary owner tag
tag @a[tag=vexp.current_tornado_owner] remove vexp.current_tornado_owner
