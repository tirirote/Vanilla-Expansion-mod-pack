# Apply pending reforges when a player holds a freshly reforged weapon.
execute as @a if data entity @s SelectedItem.components."minecraft:lore"[0] at @s run function vexp:dungeons/reforge/apply_selected
