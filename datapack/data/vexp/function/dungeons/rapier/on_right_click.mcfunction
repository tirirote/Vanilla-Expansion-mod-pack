# dungeons/rapier/on_right_click.mcfunction
# @s is the player

# Quick recoil to gain distance
# We use the facing vector of the player (-1.0 strength means backward)
# But `apply_knockback` needs a target.
# If I don't have a target, I'll use `tp`.

# Since on_right_click is usually used for utility, a quick 2-block dash backward is perfect.
tp @s ^ ^ ^-2.5

# Visuals
particle minecraft:poof ~ ~ ~ 0.25 0.5 0.25 0.1 25
playsound minecraft:entity.phantom.flap player @a[distance=..10] ~ ~ ~ 1 1
