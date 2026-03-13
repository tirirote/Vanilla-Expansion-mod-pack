# dungeons/axe_nether/projectile/on_tick.mcfunction
# @s is the projectile

function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.4, 0.35, 0.3], scale: 1.7, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 1}

particle flame ~ ~ ~ 0.1 0.1 0.1 0.02 1

# Keep item_display attached to projectile marker
execute at @s run tp @e[tag=vexp.axe_display,limit=1,distance=..2,sort=nearest] ~ ~ ~

execute as @e[tag=vexp.axe_display,limit=1,distance=..2,sort=nearest] at @s run tp @s ~ ~ ~ ~35 ~

# After 3 seconds, face owner so forward movement becomes return movement
execute if score @s vexp.proj_lifetime matches ..20 run tag @s add vexp.axe_returning
execute if entity @s[tag=vexp.axe_returning] run data modify entity @s data.proj.speed set value 1.5
execute if entity @s[tag=vexp.axe_returning] if entity @p[tag=vexp.projectile_owner,limit=1] run tp @s ~ ~ ~ facing entity @p[tag=vexp.projectile_owner,limit=1] eyes
# Auto-catch when close to owner during return phase
execute if entity @s[tag=vexp.axe_returning] if entity @p[tag=vexp.projectile_owner,limit=1,distance=..2] run function vexp:projectile/despawn
