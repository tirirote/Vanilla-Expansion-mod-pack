effect give @s speed 3 0 true
execute if block ^-1.5 ^ ^-0.5 #replaceable run tp @s ^-1.5 ^ ^-0.5 facing entity @e[tag=vexp.hitted,limit=1,sort=nearest,distance=..6]
