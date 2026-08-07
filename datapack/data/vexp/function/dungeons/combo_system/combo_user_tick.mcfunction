# Player combo user tick
# @s is the player with vexp.combo_user

# Camera look
function vexp:dungeons/combo_system/look/update

# 2.1 Resolve delayed hit queue (swoosh first, hit logic after)
function vexp:dungeons/combo_system/hooks/hit/process_delayed_tick

# On swoosh custom hook (animated)
execute if score @s vexp.hit_delay matches 1.. positioned ~ ~1.4 ~ run function vexp:dungeons/combo_system/hooks/swoosh/swoosh_wrapper

# 2.2 Resolve hold-release skills (ready + no longer holding).
execute if entity @s[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"axe"} if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold
execute if entity @s[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"pickaxe"} if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold
execute if entity @s[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"shovel"} if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold
execute if entity @s[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold

# 2.3 Axe hold cleanup: clear the charge if the player was not using an axe this tick.
execute if entity @s[tag=!vexp.skill_hold_active] if score @s vexp.skill_hold_time matches 1.. run scoreboard players set @s vexp.skill_hold_time 0
tag @s remove vexp.skill_hold_active

# 3. Parry Logic
execute if score @s vexp.parry_timer matches 1.. run function vexp:dungeons/combo_system/parry

# 4. Special hit window for player
execute if entity @s[tag=vexp.hitted.special] if score @s vexp.special_hit_window matches 1.. run scoreboard players remove @s vexp.special_hit_window 1
execute if entity @s[tag=vexp.hitted.special] if score @s vexp.special_hit_window matches 0 run tag @s remove vexp.hitted.special
