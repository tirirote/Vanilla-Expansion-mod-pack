# dungeons/armor/types/copper/tick.mcfunction
# Passive tick hook for armor type: copper
execute store result score @s vexp.armor_rand run random value -1000..1000
execute if score @s vexp.armor_rand matches -50..50 run particle instant_effect{color:10597850} ~ ~1 ~ 0.35 0.5 0.35 0 1

# Chance to deflect proyectiles
execute as @e[type=#vexp:deflectable_projectiles,distance=..2.5,tag=!vexp.parry_deflected,nbt={inGround:0b}] at @s run function vexp:projectile/deflect_reverse_motion
