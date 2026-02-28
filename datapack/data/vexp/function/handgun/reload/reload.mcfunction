# Si está llena (ammo=6), abortar
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"handgun",ammo:6}}] run return fail

# Si tiene munición (patatas venenosas personalizadas), recargar
execute if items entity @s container.* *[custom_data~{vexp:{type:"handgun_ammo"}}] run function vexp:handgun/reload/do_reload
