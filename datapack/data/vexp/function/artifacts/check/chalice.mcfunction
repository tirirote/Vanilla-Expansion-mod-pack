# Chalice check for activation

# Activate chalice when getting bad effects
execute if entity @s[nbt={active_effects:[{id:"minecraft:slowness"}]}] run function vexp:artifacts/activate/chalice
execute if entity @s[nbt={active_effects:[{id:"minecraft:wither"}]}] run function vexp:artifacts/activate/chalice
execute if entity @s[nbt={active_effects:[{id:"minecraft:poison"}]}] run function vexp:artifacts/activate/chalice
execute if entity @s[nbt={active_effects:[{id:"minecraft:blindness"}]}] run function vexp:artifacts/activate/chalice
execute if entity @s[nbt={active_effects:[{id:"minecraft:darkness"}]}] run function vexp:artifacts/activate/chalice
execute if entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run function vexp:artifacts/activate/chalice
execute if entity @s[nbt={active_effects:[{id:"minecraft:oozing"}]}] run function vexp:artifacts/activate/chalice
execute if entity @s[nbt={active_effects:[{id:"minecraft:instant_damage"}]}] run function vexp:artifacts/activate/chalice
execute if entity @s[nbt={active_effects:[{id:"minecraft:weaving"}]}] run function vexp:artifacts/activate/chalice
execute if entity @s[nbt={active_effects:[{id:"minecraft:weakness"}]}] run function vexp:artifacts/activate/chalice
