# Inicialización de Scoreboards
scoreboard objectives add vexp.id dummy
scoreboard objectives add vexp.dagger_used minecraft.used:minecraft.iron_sword
scoreboard objectives add vexp.dagger_cooldown dummy
scoreboard objectives add vexp.fuse dummy
scoreboard objectives add vexp.damage dummy
scoreboard objectives add vexp.tnt_stick_used minecraft.used:minecraft.experience_bottle
#Health bars
scoreboard objectives add vexp.hp dummy
scoreboard objectives add vexp.max_hp dummy
scoreboard objectives add vexp.old_hp dummy

#Math
scoreboard objectives add vexp.math dummy
scoreboard players set #force_scale vexp.math 100

scoreboard objectives add vexp.bullet_life dummy
scoreboard objectives add vexp.handgun_cooldown dummy
scoreboard objectives add vexp.ammo dummy
scoreboard objectives add vexp.dummy dummy

#States
scoreboard objectives add vexp.state dummy
# Combo System
scoreboard objectives add vexp.combo dummy
scoreboard objectives add vexp.combo_cooldown dummy
scoreboard objectives add vexp.hit_detected minecraft.custom:minecraft.damage_dealt
scoreboard objectives add vexp.stun_timer dummy
scoreboard objectives add vexp.right_click dummy
scoreboard objectives add vexp.gauntlets_used minecraft.used:minecraft.carrot_on_a_stick
# Feedback
scoreboard objectives add vexp.damage_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add vexp.sprint minecraft.custom:minecraft.sprint_one_cm

# Resetear ID
scoreboard players set #global vexp.id 0

# Teams for Feedback Glowing
team add vexp.white
team modify vexp.white color gray
team add vexp.yellow
team modify vexp.yellow color gold
team add vexp.red
team modify vexp.red color dark_red

