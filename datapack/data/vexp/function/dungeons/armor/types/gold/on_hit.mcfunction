# dungeons/armor/types/gold/on_hit.mcfunction
execute if score @s vexp.armor_rand matches -200..200 as @e[tag=vexp.hitted,distance=..16,limit=1] at @s run summon experience_orb ~ ~1 ~ {Value:1,Tags:["vexp.summoned_xp"]}
execute if score @s vexp.armor_rand matches -150..150 as @e[tag=vexp.hitted,distance=..16,limit=1] at @s run summon experience_orb ~ ~1 ~ {Value:3,Tags:["vexp.summoned_xp"]}
execute if score @s vexp.armor_rand matches -50..50 as @e[tag=vexp.hitted,distance=..16,limit=1] at @s run summon experience_orb ~ ~1 ~ {Value:5,Tags:["vexp.summoned_xp"]}

execute if score @s vexp.armor_rand matches -200..200 run function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}

execute as @e[tag=vexp.hitted,distance=..16,limit=1] at @s as @e[type=experience_orb,tag=vexp.summoned_xp,distance=..1,sort=nearest,limit=1] run function vexp:utils/motion/apply_random_motion {range:10, scale:0.01}
