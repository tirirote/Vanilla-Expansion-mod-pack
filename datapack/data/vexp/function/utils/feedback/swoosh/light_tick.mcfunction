# utils/feedback/swoosh/light_tick.mcfunction
# @s is armor_stand with tag vexp.swoosh_light
# Independent timer: light helper lives exactly 2 ticks.

scoreboard players add @s vexp.anim_frame 1
tag @s add vexp.swoosh.current
execute if data entity @s data.swoosh{follow_owner:1} run function vexp:utils/feedback/swoosh/follow_owner_tp with entity @s data.swoosh.follow_offset
tag @s remove vexp.swoosh.current
kill @s[scores={vexp.anim_frame=4..}]
