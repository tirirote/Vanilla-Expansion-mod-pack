# Medallion check for activation

execute store result score @s vexp.max_hp run attribute @s minecraft:max_health get 1
execute store result score @s vexp.player_hp_prev run data get entity @s Health 100

scoreboard players operation @s vexp.player_hp = @s vexp.player_hp_prev
scoreboard players operation @s vexp.player_hp /= @s vexp.max_hp

# Activate totem when hp less than 50%
execute if score @s vexp.player_hp matches ..50 unless entity @s[nbt={active_effects:[{id:"minecraft:strength"}]}] run function vexp:artifacts/activate/medallion
