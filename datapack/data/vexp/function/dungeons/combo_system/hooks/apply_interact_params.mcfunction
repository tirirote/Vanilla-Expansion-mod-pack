# dungeons/combo_system/hitbox/apply_interact_params.mcfunction

# Assign cooldown from item params
$scoreboard players set @s vexp.combo_cooldown $(cooldown)

# Item-specific interaction hook (Player side)
$execute positioned ~ ~1 ~ run function vexp:dungeons/$(item)/on_right_click

playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1