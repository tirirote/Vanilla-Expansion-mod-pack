# projectile/move/homing_dispatch.mcfunction
# Dispatcher inteligente: llama a homing selectivo o normal según data.proj.exclude_tag

execute if data entity @s data.proj.exclude_tag run function vexp:projectile/move/homing_selective with entity @s data.proj
execute unless data entity @s data.proj.exclude_tag run function vexp:projectile/move/homing with entity @s data.proj
