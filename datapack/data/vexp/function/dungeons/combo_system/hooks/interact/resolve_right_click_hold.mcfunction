# 2.2 Resolve hold-release skills (ready + no longer holding).

# Update Storage
function vexp:dungeons/combo_system/update_storage

# Resolve RC
execute if data storage vexp:dungeons.weapon combo_params.right_click_cooldown if data storage vexp:dungeons.weapon combo_params.item run function vexp:dungeons/combo_system/hooks/interact/apply_interact_params with storage vexp:dungeons.weapon combo_params

# Cleanup
scoreboard players set @s vexp.skill_hold_time 0
tag @s remove vexp.skill_hold_ready
