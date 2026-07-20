# Player Sprint Feedback
# Trail particles while sprinting based on floor block
execute as @a[predicate=vexp:is_sprinting] at @s unless block ~ ~-0.2 ~ #replaceable run particle dust_color_transition{from_color:12892061,to_color:14538947,scale:1.7} ~ ~0.2 ~ 0.2 0 0.2 1 1

# Player Damage Feedback
# Blood particles when taking damage
execute as @a[scores={vexp.damage_taken=1..}] at @s positioned ~ ~1 ~ run particle minecraft:block{block_state:"minecraft:redstone_block"} ^ ^ ^.5 0.1 0.5 0.1 0.5 5
execute as @a[scores={vexp.damage_taken=1..}] run scoreboard players set @s vexp.damage_taken 0
