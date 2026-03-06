# dungeons/dagger/on_combo.mcfunction
# @s is the target entity

# Strong pushback to target
function vexp:utils/motion/apply_knockback {strength:2, y:0.4}

# Backstab effect: Teleport attacker behind the target relative to the attacker's look direction
execute facing entity @p[tag=vexp.attacker,limit=1] feet run tp @p[tag=vexp.attacker,limit=1] ^ ^ ^-1 facing entity @s

effect give @s minecraft:speed 1 1 true

# Visual/Sound
particle minecraft:enchanted_hit ~ ~ ~ .1 .1 .1 0.2 10
particle minecraft:gust ~ ~ ~ 0 0 0 1 1
playsound minecraft:entity.phantom.flap player @a[distance=..10] ~ ~ ~ 1 1
playsound minecraft:item.trident.throw player @a[distance=..10] ~ ~ ~ 1 1
