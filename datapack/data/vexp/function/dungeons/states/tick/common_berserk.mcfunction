#Effects
effect give @s minecraft:resistance 2 0 true

execute if entity @s[tag=vexp.attacker] run effect give @s minecraft:speed 2 1 true
execute if entity @s[tag=vexp.attacker] run effect give @s minecraft:strength 2 1 true
execute if entity @s[tag=vexp.attacker] run effect give @s minecraft:haste 2 1 true

#Visuals
particle minecraft:entity_effect{color:1418338304} ~ ~1 ~ 0.2 0.5 0.2 0 1
execute if entity @s[tag=vexp.attacker] run particle angry_villager ~ ~1 ~ 0.2 0.2 0.2 0.5 1
execute if entity @s[tag=vexp.attacker] run particle flash{color:-2053120} ~ ~1 ~ 0.0 0.0 0.0 0 0

execute if entity @s[tag=vexp.attacker] positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.6, 0.5, 0.4], scale: 1.7, dX: 0.5, dY: 0.5, dZ: 0.5, speed: 0.05, count: 5}
execute if entity @s[tag=vexp.attacker] positioned ~ ~1 ~ run function vexp:utils/sound {sound: "minecraft:item.axe.wax_off", type: "player"}
