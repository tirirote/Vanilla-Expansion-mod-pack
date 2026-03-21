# dungeons/states/tick.mcfunction
# Process marked states

# 1. NETHER MARKED EFFECTS
execute as @e[tag=vexp.nether_marked] at @s run function vexp:dungeons/states/tick/nether_marked


# 2. ECHO MARKED EFFECTS
execute as @e[tag=vexp.echo_marked] at @s run function vexp:dungeons/states/tick/echo_marked
execute as @e[tag=vexp.echo_stunned] at @s run function vexp:dungeons/states/tick/echo_stunned

execute as @a[tag=vexp.echo_buffed] at @s run function vexp:dungeons/states/tick/echo_buffed
# 3. AMETHYST MARKED EFFECTS
execute as @e[tag=vexp.amethyst_marked] at @s run function vexp:dungeons/states/amethyst_physics

# Countdown
execute as @e[scores={vexp.dstate=1..}] run scoreboard players remove @s vexp.dstate 1

# Cleanup
execute as @e[tag=vexp.nether_marked,scores={vexp.dstate=..0}] run tag @s remove vexp.nether_marked
execute as @e[tag=vexp.echo_marked,scores={vexp.dstate=..0}] run tag @s remove vexp.echo_marked
execute as @e[tag=vexp.echo_buffed,scores={vexp.dstate=..0}] run tag @s remove vexp.echo_buffed

execute as @e[tag=vexp.amethyst_marked,scores={vexp.dstate=..0}] run tag @s remove vexp.amethyst_marked
