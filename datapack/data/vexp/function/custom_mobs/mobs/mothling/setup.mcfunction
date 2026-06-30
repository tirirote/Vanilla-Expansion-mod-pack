#Custom mob data
data modify entity @s data set value {vexp:{mob:{type:"mothling",custom_name:"Ashling", scale:1.5f, hp:20, speed:0.4, damage:6, special_damage:4, range:1.25, special_range:2.5, cooldown:16, special_cooldown:96, special_chance:30}}}

#Custom data
data modify entity @s variant set value "vexp:mothling"
data modify entity @s IsBaby set value false
data modify entity @s Tame set value false
data modify entity @s Anger set value 1
data modify entity @s Silent set value true
data modify entity @s DeathLootTable set value "vexp:empty"
effect give @s fire_resistance infinite 1 true
#Setup custom mob data.
function vexp:custom_mobs/setup

# Summon custom Model
function vexp:custom_mobs/custom_item_display_macro {model:"mothling_overlay", x:0f, y:0.05f, z:0.25f, rx:-0.101f, ry:0.0f, rz:0.0f, scale:2.1f, spin_rotation:0}
