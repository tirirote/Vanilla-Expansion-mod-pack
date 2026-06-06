# Projectile setup for Thundering enchantment.
# @s is the projectile entity.

data modify entity @s data.proj set value {speed:0.8, lifetime:20, gravity:-0.5, damage:1, randomness:0.2, homing_distance:12.0, exclude_tag:"thunder_stunned"}
