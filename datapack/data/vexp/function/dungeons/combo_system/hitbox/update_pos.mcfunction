# dungeons/combo_system/hitbox/update_pos.mcfunction
# @s is the interaction entity (hitbox)

# Acercamos estáticamente la hitbox al jugador (^ ^ ^1.2) para que "coma" correctamente los clics en rango quemarropa
# El daño aoe real usará $(reach) internamente sin depender de la posición exacta fina de esta entidad
tp @e[type=interaction,tag=vexp.combo_hitbox,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,limit=1,sort=nearest] ^ ^ ^1

# FeedBack: Hit Candidate (White Glowing)
# Proxemic feedback for targets inside the mathematically correct hitbox zone
# Using the SAME filters and $(range) as damage_aoe.mcfunction to avoid discrepancies
$execute as @e[type=interaction,tag=vexp.combo_hitbox,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,limit=1,sort=nearest] at @s unless entity @s[tag=vexp.hitbox.cooldown] as @e[type=!#minecraft:arrows,type=!text_display,type=!armor_stand,type=!item_display,type=!block_display,type=!interaction,type=!item_frame,type=!glow_item_frame,type=!experience_orb,type=!marker,type=!area_effect_cloud,type=!item,type=!player,distance=..$(range)] at @s run function vexp:dungeons/combo_system/hit_candidate
