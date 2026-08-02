# dungeons/combo_system/hooks/apply_interact_params_wrapper.mcfunction
# @s is the player (owner)

# Initialize cooldown if not set
execute unless score @s vexp.skill_cooldown = @s vexp.skill_cooldown run scoreboard players set @s vexp.skill_cooldown 0

# Update Storage
function vexp:dungeons/combo_system/update_storage

# Axe hold mechanic: build charge while the use action is maintained.
execute if data storage vexp:dungeons.weapon combo_params{item:"axe"} run function vexp:dungeons/combo_system/hooks/interact/handle_interact_hold
execute if data storage vexp:dungeons.weapon combo_params{item:"pickaxe"} run function vexp:dungeons/combo_system/hooks/interact/handle_interact_hold
execute if data storage vexp:dungeons.weapon combo_params{item:"shovel"} run function vexp:dungeons/combo_system/hooks/interact/handle_interact_hold
execute if data storage vexp:dungeons.weapon combo_params{item:"spellbook"} run function vexp:dungeons/combo_system/hooks/interact/handle_interact_hold

# Non-axe items keep the current immediate right-click behavior.
execute unless data storage vexp:dungeons.weapon combo_params{item:"axe"} unless data storage vexp:dungeons.weapon combo_params{item:"pickaxe"} unless data storage vexp:dungeons.weapon combo_params{item:"shovel"} unless data storage vexp:dungeons.weapon combo_params{item:"spellbook"} if score @s vexp.skill_cooldown matches 0 if data storage vexp:dungeons.weapon combo_params.right_click_cooldown if data storage vexp:dungeons.weapon combo_params.item run function vexp:dungeons/combo_system/hooks/interact/apply_interact_params with storage vexp:dungeons.weapon combo_params

# Always revoke advancement (regardless of cooldown) to allow re-detection
execute if data storage vexp:dungeons.weapon combo_params.item run function vexp:dungeons/combo_system/hooks/revoke_attack_advancement with storage vexp:dungeons.weapon combo_params
