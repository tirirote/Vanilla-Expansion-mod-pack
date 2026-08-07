# dungeons/combo_system/hooks/hit/process_delayed_tick.mcfunction

# Countdown pending hit delays
execute if entity @s[tag=vexp.hit_delay.pending] if score @s vexp.hit_delay matches 1.. run scoreboard players remove @s vexp.hit_delay 1

# Resolve queued hits when delay reaches zero
execute if entity @s[tag=vexp.hit_delay.pending] if score @s vexp.hit_delay matches 0 run function vexp:dungeons/combo_system/hooks/hit/resolve_delayed
