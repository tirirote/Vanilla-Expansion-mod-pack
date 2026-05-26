# Bridge de encantamientos custom para combo_system.

# Dummy enchant hook (extensible para futuros encantamientos custom).
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:dummy_hello" run function vexp:dungeons/enchantments/custom/dummy/hello_world
