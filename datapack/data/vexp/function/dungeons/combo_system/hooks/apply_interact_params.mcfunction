# dungeons/combo_system/hitbox/apply_interact_params.mcfunction

# Assign cooldown from item params
$scoreboard players set @s vexp.skill_cooldown $(right_click_cooldown)

function vexp:dungeons/combo_system/hooks/damage_mainhand_durability

# Item-specific interaction hook (Player side)
execute positioned ~ ~1.5 ~ run function vexp:dungeons/combo_system/hooks/route_on_right_click with storage vexp:dungeons.weapon combo_params
