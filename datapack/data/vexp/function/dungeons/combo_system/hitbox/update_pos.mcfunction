# dungeons/combo_system/hitbox/update_pos.mcfunction
# @s is the player (owner)

# Mirror owner combo cooldown into this hitbox for O(1) process checks.
scoreboard players operation #hitbox_owner_cd vexp.math = @s vexp.combo_cooldown
execute as @e[type=interaction,tag=vexp.combo_hitbox,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,limit=1,sort=nearest] run scoreboard players operation @s vexp.combo_cooldown = #hitbox_owner_cd vexp.math

# Acercamos estáticamente la hitbox al jugador (^ ^ ^1.2) para que "coma" correctamente los clics en rango quemarropa
# El daño aoe real usará $(reach) internamente sin depender de la posición exacta fina de esta entidad
tp @e[type=interaction,tag=vexp.combo_hitbox,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,limit=1,sort=nearest] ^ ^ ^1

# FeedBack: Hit Candidate (White Glowing)
# Proxemic feedback for targets inside the mathematically correct hitbox zone
# Using the SAME filters and $(range) as damage_aoe.mcfunction to avoid discrepancies
$execute positioned ^ ^ ^$(reach) if entity @e[type=interaction,tag=vexp.combo_hitbox,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,tag=!vexp.hitbox.cooldown,limit=1,sort=nearest] as @e[predicate=vexp:is_target,distance=..$(range)] at @s run function vexp:dungeons/combo_system/hit_candidate
