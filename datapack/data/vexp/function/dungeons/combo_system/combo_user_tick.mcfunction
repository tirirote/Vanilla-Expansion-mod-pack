# Player combo user tick
# @s is the player with vexp.combo_user

# Camera look
function vexp:dungeons/combo_system/look/update

# 2.1 Resolve delayed hit queue (swoosh first, hit logic after)
function vexp:dungeons/combo_system/hooks/hit/process_delayed_tick

# On swoosh custom hook (animated)
execute if score @s vexp.hit_delay matches 1.. positioned ~ ~1.4 ~ run function vexp:dungeons/combo_system/hooks/swoosh/swoosh_wrapper

# 3. Parry Logic
execute if score @s vexp.parry_timer matches 1.. run function vexp:dungeons/combo_system/parry
