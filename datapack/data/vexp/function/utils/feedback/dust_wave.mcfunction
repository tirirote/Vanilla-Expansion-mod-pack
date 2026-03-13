# utils/feedback/dust_wave.mcfunction
# Summon an expanding dust wave centered at caller position.
# Run this as/at the desired source entity.

summon marker ~ ~0.1 ~ {Tags:["vexp.dust_wave"],data:{wave_emit:{initialColor:[0.2,0.2,0.2],finalColor:[0.4,0.35,0.3],scale:1.7}}}
scoreboard players set @e[type=marker,tag=vexp.dust_wave,sort=nearest,limit=1,distance=..1.5] vexp.anim_frame 0
