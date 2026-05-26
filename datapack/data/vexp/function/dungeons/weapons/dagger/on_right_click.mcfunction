# dungeons/dagger/on_right_click.mcfunction
# @s is the player

# 3. Lanzar la daga
function vexp:dungeons/weapons/dagger/throw

# 4. Limpiar slot (La daga se consume al lanzarse)
# Limpiamos tanto mainhand como offhand si tienen una daga (para soportar ambas manos)
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{item:"dagger"}}] run item replace entity @s weapon.mainhand with air
execute if items entity @s weapon.offhand *[custom_data~{vexp:{item:"dagger"}}] run item replace entity @s weapon.offhand with air
