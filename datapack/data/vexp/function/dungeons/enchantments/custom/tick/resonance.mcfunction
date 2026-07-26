# Deal area damage when player hurted

execute if score @s vexp.enchant.resonance matches 1 store result score #resonance_chance vexp.rand run random value 0..19
execute if score @s vexp.enchant.resonance matches 2 store result score #resonance_chance vexp.rand run random value 0..13
execute if score @s vexp.enchant.resonance matches 3.. store result score #resonance_chance vexp.rand run random value 0..7

execute unless entity @s[nbt={HurtTime:0s}] if score #resonance_chance vexp.rand matches 1 run function vexp:dungeons/enchantments/custom/tick/resonance/apply_resonance
execute if score #resonance_chance vexp.rand matches 2..3 run particle entity_effect{color:-1936886785} ~ ~1 ~ 0.3 0.3 0.3 0 1
