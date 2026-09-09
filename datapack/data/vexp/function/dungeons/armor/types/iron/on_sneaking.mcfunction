# dungeons/armor/types/iron/on_sneaking.mcfunction
execute unless entity @s[tag=vexp.iron_protection] run function vexp:dungeons/armor/types/iron/iron_buff
