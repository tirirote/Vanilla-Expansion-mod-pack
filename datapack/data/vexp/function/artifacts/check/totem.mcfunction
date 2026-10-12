# Totem check for activation
# Activated in difficult situations

execute store result score @s vexp.max_hp run attribute @s minecraft:max_health get 1
execute store result score @s vexp.player_hp_prev run data get entity @s Health 100

scoreboard players operation @s vexp.player_hp = @s vexp.player_hp_prev
scoreboard players operation @s vexp.player_hp /= @s vexp.max_hp

# Activate totem when hp less than 35%
execute if score @s vexp.player_hp matches ..35 unless entity @s[nbt={active_effects:[{id:"minecraft:regeneration"}]}] run function vexp:artifacts/activate/totem

# Activate if on air for a long time
execute if predicate vexp:is_airborne run scoreboard players add @s vexp.totem_air_time 1
execute if score @s vexp.totem_air_time matches 20.. unless block ~ ~-1 ~ #replaceable unless entity @s[nbt={active_effects:[{id:"minecraft:regeneration"}]}] run function vexp:artifacts/activate/totem

# Activate if on lava
execute if block ~ ~-1 ~ lava unless entity @s[nbt={active_effects:[{id:"minecraft:regeneration"}]}] run function vexp:artifacts/activate/totem

# Safeguard cleanup
execute if score @s vexp.totem_air_time matches 20.. run scoreboard players set @s vexp.totem_air_time 0
