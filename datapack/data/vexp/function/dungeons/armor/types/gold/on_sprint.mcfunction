# dungeons/armor/types/gold/on_sprint.mcfunction
# Triggered when player is sprinting (per sprint pulse)

# 2% Random chance of getting an xp_orb
execute if score @s vexp.armor_rand matches -2..2 run summon experience_orb ~ ~1 ~ {Value:1,Tags:["vexp.summoned_xp"]}
execute if score @s vexp.armor_rand matches -2..2 run function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}
execute as @e[type=experience_orb,tag=vexp.summoned_xp,distance=..2,sort=nearest,limit=1] run function vexp:utils/motion/apply_random_motion {range:10, scale:0.01}

# 2% chance of getting buffed
execute if score @s vexp.armor_rand matches -2..2 run function vexp:dungeons/armor/types/gold/gold_aura
