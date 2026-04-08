# dungeons/combo_system/hitted_entity.mcfunction
# @s is the mob being hitted

effect give @s minecraft:glowing 1 1 true

# Color Priority: Combo End (Red) > Hit (Yellow)
execute if entity @s[tag=vexp.hitted.combo_end] run team join vexp.red @s
execute unless entity @s[tag=vexp.hitted.combo_end] run team join vexp.yellow @s

# Re-apply glowing for feedback
# Re-apply glowing for feedback
tag @s add vexp.feedback_glowing

particle minecraft:entity_effect{color:2084647218} ~ ~1 ~ .2 .2 .2 0 3
