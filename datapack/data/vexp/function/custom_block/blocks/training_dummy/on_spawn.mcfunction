# On spawn
# @s is the cutom block interaction

# Input: $(name) y demas attrs
execute as @e[type=item_display,tag=vexp.custom_block.display,distance=..1] run tag @s add vexp.custom_block.dummy

execute at @s run summon vindicator ~ ~1 ~ {Tags:["vexp.custom_block.dummy_mob","vexp.temp_dummy"], Silent:1b, NoAI:1b, PersistenceRequired:1b, CustomNameVisible:0b, CustomName:"Muñeco de Entrenamiento", attributes:[{id:"minecraft:max_health",base:1000f}, {id:"minecraft:knockback_resistance",base:1.0f}], Health:1000f, active_effects:[{id:"minecraft:regeneration",amplifier:100b,duration:-1,show_particles:0b},{id:"minecraft:invisibility",amplifier:1b,duration:-1,show_particles:0b}], DeathLootTable:"vexp:empty"}

# Sync ID
execute as @e[tag=vexp.temp_dummy,limit=1,sort=nearest] run scoreboard players operation @s vexp.id = #global vexp.id

# Cleanup temp
tag @e[tag=vexp.temp_dummy] remove vexp.temp_dummy
