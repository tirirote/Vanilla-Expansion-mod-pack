# dungeons/sword/glowing/on_right_click.mcfunction
# @s is the player
scoreboard players set @s vexp.parry_timer 40
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken

particle flash{color:-6488120} ~ ~-.5 ~ 0 0 0 0 0
particle squid_ink ~ ~-.5 ~ 0.2 0.5 0.2 0.1 5
function vexp:utils/sound {sound: "minecraft:entity.glow_squid.hurt", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
