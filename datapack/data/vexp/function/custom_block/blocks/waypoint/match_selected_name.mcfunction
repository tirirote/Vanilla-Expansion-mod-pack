# match_selected_name.mcfunction
# Macro: reescribe minecraft:entity_data del item seleccionado.
# Input: $(entity_data)
# Contexto: se ejecuta AS el jugador.

$item replace entity @s weapon.mainhand from entity @s weapon.mainhand {"function":"minecraft:set_components","components":{"minecraft:entity_data":$(entity_data)}}
