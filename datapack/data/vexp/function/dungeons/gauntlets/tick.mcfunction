# dungeons/gauntlets/tick.mcfunction
# Parry Logic
# If HurtTime is 10s and player is parrying -> Trigger Parry feedback
# (Resistance 5 might prevent HurtTime from triggering, but we can't easily cancel damage otherwise)
# If HurtTime doesn't trigger, we'll just check distance to mobs and knock them back?
# Let's use distance for "Parry".

# If parrying, knockback any mob that's extremely close (as if they were attacking)
execute as @a[tag=vexp.gauntlets.parry] at @s as @e[type=!player,distance=..2.5,sort=nearest,limit=1] at @s run function vexp:dungeons/gauntlets/parry_trigger

# Timer for parry state
execute as @a[scores={vexp.dummy=1..}] run scoreboard players remove @s vexp.dummy 1
execute as @a[scores={vexp.dummy=0},tag=vexp.gauntlets.parry] run tag @s remove vexp.gauntlets.parry
