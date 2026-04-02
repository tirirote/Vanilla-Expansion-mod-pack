# dungeons/armor/types/leather/drop_common_loot_pick.mcfunction
execute if score #armor_loot_roll vexp.math matches 1 run summon item ~ ~1 ~ {Item:{id:"minecraft:iron_nugget",count:1b}}
execute if score #armor_loot_roll vexp.math matches 2 run summon item ~ ~1 ~ {Item:{id:"minecraft:stick",count:1b}}
execute if score #armor_loot_roll vexp.math matches 3 run summon item ~ ~1 ~ {Item:{id:"minecraft:string",count:1b}}
execute if score #armor_loot_roll vexp.math matches 4 run summon item ~ ~1 ~ {Item:{id:"minecraft:feather",count:1b}}
execute if score #armor_loot_roll vexp.math matches 5 run summon item ~ ~1 ~ {Item:{id:"minecraft:clay_ball",count:1b}}
execute if score #armor_loot_roll vexp.math matches 6 run summon item ~ ~1 ~ {Item:{id:"minecraft:flint",count:1b}}
execute if score #armor_loot_roll vexp.math matches 7 run summon item ~ ~1 ~ {Item:{id:"minecraft:gunpowder",count:1b}}
execute if score #armor_loot_roll vexp.math matches 8 run summon item ~ ~1 ~ {Item:{id:"minecraft:glowstone_dust",count:1b}}
