# dungeons/glowing_axe/projectile/on_tick.mcfunction
particle glow ~ ~ ~ 0.35 0.35 0.35 0 1
particle instant_effect{color:1261362} ~ ~ ~ 0.2 0.2 0.2 0 2
particle dust_color_transition{from_color:7798726,to_color:1261362,scale:1.7} ~ ~ ~ 0.2 0.2 0.2 0 5
