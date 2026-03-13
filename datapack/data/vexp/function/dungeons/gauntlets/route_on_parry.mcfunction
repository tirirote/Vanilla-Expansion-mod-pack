# dungeons/gauntlets/route_on_parry.mcfunction
# @s is the player

# Special qualities
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"netherite"}}}] run function vexp:dungeons/gauntlets/netherite/on_parry
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"echo"}}}] run function vexp:dungeons/gauntlets/echo/on_parry
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"amethyst"}}}] run function vexp:dungeons/gauntlets/amethyst/on_parry

# Default quality
execute unless items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"netherite"}}}] unless items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"echo"}}}] unless items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"amethyst"}}}] run function vexp:dungeons/gauntlets/on_parry
