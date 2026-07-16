# Give Dagger (Common)
# Ejecutado AS @s (jugador)

# Base data for every dagger
execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"wooden_sword", model:"vexp:wooden_dagger",spd:6.0 , max_damage:59, repair_material:["minecraft:oak_planks","minecraft:spruce_planks","minecraft:birch_planks","minecraft:jungle_planks","minecraft:acacia_planks","minecraft:dark_oak_planks","minecraft:pale_oak_planks","minecraft:crimson_planks","minecraft:warped_planks","minecraft:mangrove_planks","minecraft:bamboo_planks","minecraft:cherry_planks"]}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"stone_sword", model:"vexp:stone_dagger",spd:2.667 , max_damage:131, repair_material:["cobblestone", "cobbled_deepslate"]}
execute if entity @s[tag=vexp.bone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", model:"vexp:bone_dagger",spd:2.667 , max_damage:96, repair_material:["bone_block"]}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"copper_sword", model:"vexp:copper_dagger",spd:1 , max_damage:190, repair_material:["copper_ingot"]}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", model:"vexp:iron_dagger",spd:1 , max_damage:250, repair_material:["iron_ingot"]}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"golden_sword", model:"vexp:golden_dagger",spd:6.0 , max_damage:32, repair_material:["gold_ingot"]}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", model:"vexp:diamond_dagger",spd:-0.667 , max_damage:1561, repair_material:["diamond"]}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", model:"vexp:netherite_dagger",spd:-1.5 , max_damage:2031, repair_material:["netherite_ingot"]}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", model:"vexp:resonance_dagger",spd:0 , max_damage:1891, repair_material:["echo_shard"]}
execute if entity @s[tag=vexp.glowing] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword",model:"vexp:glowing_dagger",spd:1 , max_damage:981, repair_material:["command_block"]}

# Custom dagger data
data modify storage vexp:dungeons.weapon params.name set from storage vexp:dungeons.weapon dagger_data.name
data modify storage vexp:dungeons.weapon params.combo set from storage vexp:dungeons.weapon dagger_data.combo
data modify storage vexp:dungeons.weapon params.material set from storage vexp:dungeons.weapon dagger_data.material

execute if data storage vexp:dungeons.weapon dagger_data.custom_name run data modify storage vexp:dungeons.weapon params.custom_name set from storage vexp:dungeons.weapon dagger_data.custom_name

execute if data storage vexp:dungeons.weapon dagger_data.reforge run data modify storage vexp:dungeons.weapon params.reforge set from storage vexp:dungeons.weapon dagger_data.reforge

# Restaurar durabilidad desde scoreboard solo cuando la daga viene de un proyectil recogido
execute if entity @s[tag=vexp.restore_dagger_damage] store result storage vexp:dungeons.weapon params.item_damage int 1 run scoreboard players get @s vexp.damage
execute unless entity @s[tag=vexp.restore_dagger_damage] run data modify storage vexp:dungeons.weapon params.item_damage set value 0

# Restaurar encantamientos cuando la daga viene de proyectil/stuck pickup
execute if entity @s[tag=vexp.restore_dagger_enchantments] run data modify storage vexp:dungeons.weapon params.enchantments set from storage vexp:dungeons.weapon return.enchantments
execute unless entity @s[tag=vexp.restore_dagger_enchantments] run data modify storage vexp:dungeons.weapon params.enchantments set value {}

# 2. Give macro condicional
execute if data storage vexp:dungeons.weapon params.reforge if data storage vexp:dungeons.weapon params.custom_name run function vexp:dungeons/weapons/dagger/give_macro_reforge_custom_name with storage vexp:dungeons.weapon params
execute if data storage vexp:dungeons.weapon params.reforge unless data storage vexp:dungeons.weapon params.custom_name run function vexp:dungeons/weapons/dagger/give_macro_reforge with storage vexp:dungeons.weapon params
execute unless data storage vexp:dungeons.weapon params.reforge if data storage vexp:dungeons.weapon params.custom_name run function vexp:dungeons/weapons/dagger/give_macro_custom_name with storage vexp:dungeons.weapon params
execute unless data storage vexp:dungeons.weapon params.reforge unless data storage vexp:dungeons.weapon params.custom_name run function vexp:dungeons/weapons/dagger/give_macro with storage vexp:dungeons.weapon params

# 3. Limpieza
tag @s remove vexp.iron
tag @s remove vexp.wood
tag @s remove vexp.stone
tag @s remove vexp.bone
tag @s remove vexp.gold
tag @s remove vexp.diamond
tag @s remove vexp.copper
tag @s remove vexp.netherite
tag @s remove vexp.echo
tag @s remove vexp.glowing
tag @s remove vexp.amethyst
tag @s remove vexp.restore_dagger_damage
tag @s remove vexp.restore_dagger_enchantments
scoreboard players set @s vexp.damage 0

data remove storage vexp:dungeons.weapon return
data remove storage vexp:dungeons.weapon params
data remove storage vexp:dungeons.weapon dagger_data
