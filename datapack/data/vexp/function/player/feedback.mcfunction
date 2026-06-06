# Player Sprint Feedback
# Trail particles while sprinting based on floor block
execute as @a[scores={vexp.sprint=1..}] at @s run function vexp:player/sprint_particle
scoreboard players set @a[scores={vexp.sprint=1..}] vexp.sprint 0

# Player Damage Feedback
# Blood particles when taking damage
execute as @a[scores={vexp.damage_taken=1..}] at @s positioned ~ ~1 ~ run particle minecraft:block{block_state:"minecraft:redstone_block"} ^ ^ ^.5 0.1 0.5 0.1 0.5 5
execute as @a[scores={vexp.damage_taken=1..}] run scoreboard players set @s vexp.damage_taken 0
