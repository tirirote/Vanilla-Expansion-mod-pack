# dungeons/sword/on_right_click.mcfunction
# @s is the player

# Start circular spin attack for 1 second (20 ticks).
scoreboard players set @s vexp.sword_spin_timer 20

# Startup feedback
particle minecraft:sweep_attack ~ ~1 ~ 0.2 0.2 0.2 0 1
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
