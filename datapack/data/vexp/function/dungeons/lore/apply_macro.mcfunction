# dungeons/lore/apply_macro.mcfunction
# Called with storage vexp:temp lore_apply
# {
#   desc, rc_desc, bonus_desc
#   combo_dmg, combo_reach, combo_range, combo_cooldown right_click_cooldown,
#   custom_data: <compound>
# }

$item replace entity @s weapon.mainhand from entity @s weapon.mainhand {"function":"minecraft:set_components","components":{"minecraft:lore":[{"text":"- $(desc_line0)","italic":true,"color":"dark_gray"},{"text":"$(desc_line1) -","italic":true,"color":"dark_gray"},{"text":""},{"text":"• Daño: ","italic":false,"color":"gray","extra":[{"text":"+$(combo_dmg)","italic":false,"color":"gold"}]},{"text":"• Alcance: ","italic":false,"color":"gray","extra":[{"text":"+$(combo_reach)","italic":false,"color":"gold"}]},{"text":"• Area: ","italic":false,"color":"gray","extra":[{"text":"+$(combo_range)","italic":false,"color":"gold"}]},{"text":"• Velocidad de Ataque: ","italic":false,"color":"gray","extra":[{"text":"$(combo_cooldown_sec_int).$(combo_cooldown_sec_dec)s","italic":false,"color":"white"}]},{"text":""},{"text":"$(rc_name) [Click Derecho]: ","italic":false,"color":"yellow"},{"text":"$(rc_desc_line0)","italic":false,"color":"gray"},{"text":"$(rc_desc_line1)","italic":false,"color":"gray"},{"text":""},{"text":"• Enfriamiento: ","italic":false,"color":"gray","extra":[{"text":"$(right_click_cooldown_sec_int).$(right_click_cooldown_sec_dec)s","italic":false,"color":"white"}]},{"text":""},{"text":"Se puede reforjar","italic":false,"color":"blue"},{"text":"• Reforjas [$(reforge_left) / $(reforge_max)]","italic":false,"color":"blue"}],"minecraft:custom_data":$(custom_data)}}
