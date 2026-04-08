# utils/feedback/swoosh/light_tick.mcfunction
# @s is armor_stand with tag vexp.swoosh_light
# Independent timer: light helper lives exactly 2 ticks.

scoreboard players add @s vexp.anim_frame 1
kill @s[scores={vexp.anim_frame=4..}]
