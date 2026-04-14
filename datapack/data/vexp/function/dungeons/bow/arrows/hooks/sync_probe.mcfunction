# dungeons/bow/arrows/hooks/sync_probe.mcfunction
# @s is a custom bow arrow, position is arrow position.
# Sync linked probe marker data so hit detection can continue if arrow despawns.

scoreboard players operation #temp vexp.id = @s vexp.id

# Keep linked probe at current arrow position and refresh life window.
execute as @e[type=minecraft:marker,tag=vexp.bow_probe,distance=..6] if score @s vexp.id = #temp vexp.id run tp @s ~ ~ ~
execute as @e[type=minecraft:marker,tag=vexp.bow_probe,distance=..6] if score @s vexp.id = #temp vexp.id run scoreboard players set @s vexp.timer 8

# Copy damage for indicator/hit logic when probe resolves impact.
data modify storage vexp:temp bow_probe_damage set from entity @s damage
execute as @e[type=minecraft:marker,tag=vexp.bow_probe,distance=..6] if score @s vexp.id = #temp vexp.id run data modify entity @s data.vexp.arrow_damage set from storage vexp:temp bow_probe_damage

# Mirror classification tags used by on_hit_mob routing.
execute if entity @s[tag=vexp.common_arrow] as @e[type=minecraft:marker,tag=vexp.bow_probe,distance=..6] if score @s vexp.id = #temp vexp.id run tag @s add vexp.common_arrow
execute if entity @s[tag=vexp.netherite_arrow] as @e[type=minecraft:marker,tag=vexp.bow_probe,distance=..6] if score @s vexp.id = #temp vexp.id run tag @s add vexp.netherite_arrow
execute if entity @s[tag=vexp.resonance_arrow] as @e[type=minecraft:marker,tag=vexp.bow_probe,distance=..6] if score @s vexp.id = #temp vexp.id run tag @s add vexp.resonance_arrow
execute if entity @s[tag=vexp.arrow_t1] as @e[type=minecraft:marker,tag=vexp.bow_probe,distance=..6] if score @s vexp.id = #temp vexp.id run tag @s add vexp.arrow_t1
execute if entity @s[tag=vexp.arrow_t2] as @e[type=minecraft:marker,tag=vexp.bow_probe,distance=..6] if score @s vexp.id = #temp vexp.id run tag @s add vexp.arrow_t2
execute if entity @s[tag=vexp.arrow_t3] as @e[type=minecraft:marker,tag=vexp.bow_probe,distance=..6] if score @s vexp.id = #temp vexp.id run tag @s add vexp.arrow_t3
execute if entity @s[tag=vexp.combo_arrow_charged] as @e[type=minecraft:marker,tag=vexp.bow_probe,distance=..6] if score @s vexp.id = #temp vexp.id run tag @s add vexp.combo_arrow_charged
