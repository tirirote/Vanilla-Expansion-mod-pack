# Projectile setup for Thundering enchantment.
# @s is the projectile entity.

data modify entity @s data.proj set value {speed:1.5, lifetime:14, damage:1, gravity:0.0, randomness:0.0, homing_distance:12.0, model:{strings:["vexp:enchantment_thundering"]}, exclude_tag:"thunder_stunned"}
