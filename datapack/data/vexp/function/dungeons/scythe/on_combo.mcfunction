# dungeons/scythe/on_combo.mcfunction
# @s is the target entity

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-5, y:0.4}

# Visuals
particle minecraft:angry_villager ~ ~ ~ 0.5 0.2 0.5 0.5 3
particle minecraft:squid_ink ~ ~ ~ .5 .2 .5 .1 5
particle minecraft:sweep_attack ~ ~ ~ 0 0 0 1 1
playsound minecraft:item.trident.throw player @a ~ ~ ~ 1 0.5
playsound entity.phantom.flap player @a[distance=..10] ~ ~ ~ 1 0.5
