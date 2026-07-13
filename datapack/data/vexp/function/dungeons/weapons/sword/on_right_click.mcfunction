# dungeons/sword/on_right_click.mcfunction
# @s is the player
scoreboard players set @s vexp.parry_timer 30
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken

effect give @s slowness 2 2 true
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player", pitch:1}
