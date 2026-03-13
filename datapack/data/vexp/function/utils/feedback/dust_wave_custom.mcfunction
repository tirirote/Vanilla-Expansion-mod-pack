# utils/feedback/dust_wave_custom.mcfunction
# Customizable expanding dust wave.
# Expected macro params: $(initialColor), $(finalColor), $(scale)
# Example:
# function vexp:utils/feedback/dust_wave_custom {initialColor:[0.1,0.6,1.0],finalColor:[0.6,0.9,1.0],scale:1.6}

$summon marker ~ ~0.1 ~ {Tags:["vexp.dust_wave"],data:{wave_emit:{initialColor:$(initialColor),finalColor:$(finalColor),scale:$(scale)}}}
scoreboard players set @e[type=marker,tag=vexp.dust_wave,sort=nearest,limit=1,distance=..1.5] vexp.anim_frame 0
