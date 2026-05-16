# dungeons/bow/hooks/on_using_bow.mcfunction
# @s is the player that is currently using a bow.

# Heartbeat while the player is actively holding right click with a custom bow.
# bow/tick decrements this and uses it to detect release.
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{item:"bow"}}] run scoreboard players set @s vexp.arrow_draw_tier 2

# Count draw time only for custom bows.
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{item:"bow"}}] run scoreboard players add @s vexp.bow_draw_ticks 1

# Trigger bow right-click hook only once at charge start (avoid per-tick spam).
execute if score @s vexp.bow_draw_ticks matches 3.. if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"netherite"}}}] run function vexp:dungeons/bow/netherite/on_right_click
execute if score @s vexp.bow_draw_ticks matches 3.. if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"echo"}}}] run function vexp:dungeons/bow/echo/on_right_click
execute if score @s vexp.bow_draw_ticks matches 3.. if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"gold"}}}] run function vexp:dungeons/bow/gold/on_right_click
execute if score @s vexp.bow_draw_ticks matches 3.. if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"diamond"}}}] run function vexp:dungeons/bow/diamond/on_right_click
execute if score @s vexp.bow_draw_ticks matches 3.. if items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"glowing"}}}] run function vexp:dungeons/bow/glowing/on_right_click
execute if score @s vexp.bow_draw_ticks matches 3.. unless items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"netherite"}}}] unless items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"echo"}}}] unless items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"gold"}}}] unless items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"diamond"}}}] unless items entity @s weapon.mainhand *[custom_data~{vexp:{combo:{quality:"glowing"}}}] run function vexp:dungeons/bow/on_right_click

# Allow re-trigger every tick while using item.
advancement revoke @s only vexp:event/bow_attack
