# Resonance wave
tag @s add vexp.enchantment_resonance
tag @s add vexp.attacker

#Buff
function vexp:dungeons/states/resonance_enchant_buff

# Cache owner ID for self-filter in target queries.
scoreboard players operation #combo_owner_id vexp.id = @s vexp.id
execute if score @s vexp.enchant.resonance matches 1 as @e[predicate=vexp:is_target,distance=..4.5] unless score @s vexp.id = #combo_owner_id vexp.id at @s run function vexp:utils/deal_damage {damage: 2,type:"magic",by:"@p[tag=vexp.enchantment_resonance,limit=1]"}
execute if score @s vexp.enchant.resonance matches 2 as @e[predicate=vexp:is_target,distance=..4.5] unless score @s vexp.id = #combo_owner_id vexp.id at @s run function vexp:utils/deal_damage {damage: 3,type:"magic",by:"@p[tag=vexp.enchantment_resonance,limit=1]"}
execute if score @s vexp.enchant.resonance matches 3.. as @e[predicate=vexp:is_target,distance=..4.5] unless score @s vexp.id = #combo_owner_id vexp.id at @s run function vexp:utils/deal_damage {damage: 4,type:"magic",by:"@p[tag=vexp.enchantment_resonance,limit=1]"}

execute as @e[predicate=vexp:is_target,distance=..4.5] unless score @s vexp.id = #combo_owner_id vexp.id at @s run function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.1}

# Feedback
function vexp:dungeons/fx/enchantments/resonance

tag @s[tag=vexp.enchantment_resonance] remove vexp.enchantment_resonance
