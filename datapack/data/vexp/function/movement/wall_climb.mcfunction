# Wall climb impulse
# Small vertical step and subtle particle feedback
tp @s ^ ^1 ^
effect give @s minecraft:slow_falling 1 255 true
particle minecraft:cloud ~ ~1 ~ 0.08 0.12 0.08 0.01 3

# Short cooldown to avoid excessive spam
scoreboard players set @s vexp.move_climb_ready 0
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
