# Si está llena (damage=0), abortar
execute if items entity @s weapon.mainhand *[damage=0] run return fail

# Si tiene munición (patatas venenosas personalizadas), recargar
execute if items entity @s container.* *[custom_data~{vexp:{type:"handgun_ammo"}}] run function vexp:handgun/reload/do_reload
