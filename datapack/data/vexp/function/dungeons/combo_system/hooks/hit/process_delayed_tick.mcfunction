# dungeons/combo_system/hooks/hit/process_delayed_tick.mcfunction

# Countdown pending hit delays
execute as @a[tag=vexp.hit_delay.pending,scores={vexp.hit_delay=1..}] run scoreboard players remove @s vexp.hit_delay 1

# Resolve queued hits when delay reaches zero
execute as @a[tag=vexp.hit_delay.pending,scores={vexp.hit_delay=0}] at @s run function vexp:dungeons/combo_system/hooks/hit/resolve_delayed
