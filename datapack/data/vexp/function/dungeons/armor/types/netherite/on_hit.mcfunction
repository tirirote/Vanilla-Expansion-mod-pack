# dungeons/armor/types/netherite/on_hit.mcfunction
execute store result score #armor_rng vexp.math run random value 1..100
execute if score #armor_rng vexp.math matches 1..5 positioned ~ ~-1.5 ~ run function vexp:projectile/projectiles/dagger/netherite/aoe_wave

