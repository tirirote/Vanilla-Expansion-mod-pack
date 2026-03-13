# @s is the projectile

# Remove visual axe display before marker is deleted
execute as @e[tag=vexp.axe_display,distance=..2,sort=nearest,limit=1] run kill @s

# Return axe item to owner
data modify storage vexp:main params set value {item_id:"netherite_axe", name:"Hacha de Netherite", model:"vexp:none", quality:"netherite", dmg:12.0, spd:-3.2, combo_dmg:14, combo_cooldown:26, combo_range:3.5, combo_reach:1.8, reach_mod:-1.0}
execute as @p[tag=vexp.projectile_owner,limit=1] run function vexp:dungeons/axe/give_macro with storage vexp:main params
execute store result entity @p[tag=vexp.projectile_owner,limit=1] SelectedItem.components."minecraft:damage" int 1 run scoreboard players get @s vexp.damage
data remove storage vexp:main params

# Return pulse at owner: light damage + mark in ..2
execute at @p[tag=vexp.projectile_owner,limit=1] run playsound minecraft:item.trident.return player @a ~ ~ ~ 0.8 1.1