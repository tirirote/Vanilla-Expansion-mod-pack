# Snitcher summons his mom
execute if score @s vexp.rand matches ..20 if block ^2 ^ ^-2 #replaceable run summon vindicator ^2 ^ ^-2
execute if score @s vexp.rand matches 21..40 if block ^-2 ^ ^-2 #replaceable run summon pillager ^-2 ^ ^-2
execute if score @s vexp.rand matches 41..60 if block ^-2 ^ ^-2 #replaceable run summon vindicator ^-2 ^ ^-2
execute if score @s vexp.rand matches 61..80 if block ^-2 ^ ^-2 #replaceable run summon pillager ^1 ^ ^-2
execute if score @s vexp.rand matches 81.. if block ^-2 ^ ^-2 #replaceable run summon vindicator ^-1 ^ ^-2

