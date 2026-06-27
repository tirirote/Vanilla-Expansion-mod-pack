# Hitmark Indicator Position
# 1. Update always hitmarks rotation

# 2. Update Indicator's Logic via cooldown state
execute if entity @e[type=interaction,tag=vexp.combo_hitbox,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,tag=!vexp.hitbox.cooldown,limit=1,sort=nearest] run data modify entity @e[type=item_display,tag=vexp.combo_hitbox_indicator,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,limit=1,sort=nearest] item.components."minecraft:custom_model_data".strings set value ["vexp:hit_indicator_candidate"]

execute if entity @e[type=interaction,tag=vexp.combo_hitbox,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,tag=!vexp.hitbox.cooldown,limit=1,sort=nearest] run data modify entity @e[type=item_display,tag=vexp.combo_hitbox_indicator,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,limit=1,sort=nearest] Glowing set value true

execute if entity @e[type=interaction,tag=vexp.combo_hitbox,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,tag=vexp.hitbox.cooldown,limit=1,sort=nearest] run data modify entity @e[type=item_display,tag=vexp.combo_hitbox_indicator,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,limit=1,sort=nearest] item.components."minecraft:custom_model_data".strings set value ["vexp:hit_indicator_cooldown"]

execute if entity @e[type=interaction,tag=vexp.combo_hitbox,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,tag=vexp.hitbox.cooldown,limit=1,sort=nearest] run data modify entity @e[type=item_display,tag=vexp.combo_hitbox_indicator,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,limit=1,sort=nearest] Glowing set value false

execute positioned ^ ^ ^2.5 run tp @e[type=item_display,tag=vexp.combo_hitbox_indicator,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,limit=1,sort=nearest] ~ ~0.65 ~ facing entity @s eyes

