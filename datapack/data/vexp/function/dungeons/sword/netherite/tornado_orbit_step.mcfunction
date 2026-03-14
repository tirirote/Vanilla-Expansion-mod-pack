# One tornado orbit sub-step (called twice per tick for 2x frame-rate)
scoreboard players add @s vexp.anim_frame 1

# Progressive expansion radius with finer bands
execute if entity @s[tag=vexp.sword_tornado.cw] if score @s vexp.anim_frame matches ..5 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^1.2 run tp @s ~ ~ ~ ~7.5 ~
execute if entity @s[tag=vexp.sword_tornado.ccw] if score @s vexp.anim_frame matches ..5 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^-1.2 run tp @s ~ ~ ~ ~7.5 ~

execute if entity @s[tag=vexp.sword_tornado.cw] if score @s vexp.anim_frame matches 6..11 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^1.4 run tp @s ~ ~ ~ ~7.5 ~
execute if entity @s[tag=vexp.sword_tornado.ccw] if score @s vexp.anim_frame matches 6..11 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^-1.4 run tp @s ~ ~ ~ ~7.5 ~

execute if entity @s[tag=vexp.sword_tornado.cw] if score @s vexp.anim_frame matches 12..17 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^1.6 run tp @s ~ ~ ~ ~7.5 ~
execute if entity @s[tag=vexp.sword_tornado.ccw] if score @s vexp.anim_frame matches 12..17 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^-1.6 run tp @s ~ ~ ~ ~7.5 ~

execute if entity @s[tag=vexp.sword_tornado.cw] if score @s vexp.anim_frame matches 18..23 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^1.8 run tp @s ~ ~ ~ ~7.5 ~
execute if entity @s[tag=vexp.sword_tornado.ccw] if score @s vexp.anim_frame matches 18..23 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^-1.8 run tp @s ~ ~ ~ ~7.5 ~

execute if entity @s[tag=vexp.sword_tornado.cw] if score @s vexp.anim_frame matches 24..29 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^2.0 run tp @s ~ ~ ~ ~7.5 ~
execute if entity @s[tag=vexp.sword_tornado.ccw] if score @s vexp.anim_frame matches 24..29 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^-2.0 run tp @s ~ ~ ~ ~7.5 ~

execute if entity @s[tag=vexp.sword_tornado.cw] if score @s vexp.anim_frame matches 30..35 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^2.2 run tp @s ~ ~ ~ ~7.5 ~
execute if entity @s[tag=vexp.sword_tornado.ccw] if score @s vexp.anim_frame matches 30..35 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^-2.2 run tp @s ~ ~ ~ ~7.5 ~

execute if entity @s[tag=vexp.sword_tornado.cw] if score @s vexp.anim_frame matches 36..41 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^2.4 run tp @s ~ ~ ~ ~7.5 ~
execute if entity @s[tag=vexp.sword_tornado.ccw] if score @s vexp.anim_frame matches 36..41 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^-2.4 run tp @s ~ ~ ~ ~7.5 ~

execute if entity @s[tag=vexp.sword_tornado.cw] if score @s vexp.anim_frame matches 42..47 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^2.6 run tp @s ~ ~ ~ ~7.5 ~
execute if entity @s[tag=vexp.sword_tornado.ccw] if score @s vexp.anim_frame matches 42..47 at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^-2.6 run tp @s ~ ~ ~ ~7.5 ~

execute if entity @s[tag=vexp.sword_tornado.cw] if score @s vexp.anim_frame matches 48.. at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^2.8 run tp @s ~ ~ ~ ~7.5 ~
execute if entity @s[tag=vexp.sword_tornado.ccw] if score @s vexp.anim_frame matches 48.. at @a[tag=vexp.current_tornado_owner,limit=1] rotated as @s positioned ^ ^1.1 ^-2.8 run tp @s ~ ~ ~ ~7.5 ~
