# dungeons/states/tick.mcfunction
# Process marked states

# 1. NETHER MARKED EFFECTS
execute as @e[tag=vexp.nether_marked] at @s run function vexp:dungeons/states/tick/nether_marked
execute as @a[tag=vexp.nether_buffed] at @s run function vexp:dungeons/states/tick/nether_buffed

# 2. ECHO MARKED EFFECTS
execute as @e[tag=vexp.echo_scared] at @s run function vexp:dungeons/states/tick/echo_scared
execute as @e[tag=vexp.echo_marked] at @s run function vexp:dungeons/states/tick/echo_marked

execute as @a[tag=vexp.echo_buffed] at @s run function vexp:dungeons/states/tick/echo_buffed

# 3. Glowing effects
execute as @e[tag=vexp.glow_marked] at @s run function vexp:dungeons/states/tick/glow_marked
execute as @e[tag=vexp.glow_confused] at @s run function vexp:dungeons/states/tick/glow_confused

execute as @a[tag=vexp.glow_buffed] at @s run function vexp:dungeons/states/tick/glow_buffed
#Subtle Buffs
execute as @a[tag=vexp.gold_buffed] at @s run function vexp:dungeons/states/tick/gold_buffed
execute as @a[tag=vexp.diamond_buffed] at @s run function vexp:dungeons/states/tick/diamond_buffed

#Catched
execute as @e[tag=vexp.state.catched] at @s run function vexp:dungeons/states/tick/catched
# Release caught mob if player switches away from gauntlets or timer expired
execute as @e[tag=vexp.state.catched,scores={vexp.dstate=..0}] at @s run function vexp:dungeons/states/catch_release

# Countdown
execute as @e[scores={vexp.dstate=1..}] run scoreboard players remove @s vexp.dstate 1

# Cleanup
#Player tags
execute as @e[tag=vexp.nether_buffed,scores={vexp.dstate=..0}] run tag @s remove vexp.nether_buffed
execute as @a[tag=vexp.echo_buffed,scores={vexp.dstate=..0}] run tag @s remove vexp.echo_buffed
execute as @a[tag=vexp.gold_buffed,scores={vexp.dstate=..0}] run tag @s remove vexp.gold_buffed
execute as @a[tag=vexp.diamond_buffed,scores={vexp.dstate=..0}] run tag @s remove vexp.diamond_buffed
execute as @a[tag=vexp.glow_buffed,scores={vexp.dstate=..0}] run tag @s remove vexp.glow_buffed

#Entity tags
execute as @e[tag=vexp.nether_marked,scores={vexp.dstate=..0}] run tag @s remove vexp.nether_marked
execute as @e[tag=vexp.echo_marked,scores={vexp.dstate=..0}] run tag @s remove vexp.echo_marked
execute as @e[tag=vexp.echo_scared,scores={vexp.dstate=..0}] run tag @s remove vexp.echo_scared

execute as @e[tag=vexp.glow_marked,scores={vexp.dstate=..0}] run tag @s remove vexp.glow_marked
execute as @e[tag=vexp.glow_confused,scores={vexp.dstate=..0}] run tag @s remove vexp.glow_confused
