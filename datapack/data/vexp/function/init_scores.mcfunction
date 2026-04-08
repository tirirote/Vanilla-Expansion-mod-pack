# Inicialización de Scoreboards
scoreboard objectives add vexp.id dummy
scoreboard objectives add vexp.dagger_used minecraft.used:minecraft.iron_sword
scoreboard objectives add vexp.dagger_cooldown dummy
scoreboard objectives add vexp.anim_frame dummy
scoreboard objectives add vexp.anim_delay dummy
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
scoreboard players set #neg_one vexp.math -1
scoreboard players set #smooth_keep vexp.math 4
scoreboard players set #smooth_div vexp.math 5

scoreboard objectives add vexp.bullet_life dummy
scoreboard objectives add vexp.handgun_cooldown dummy
scoreboard objectives add vexp.ammo dummy
scoreboard objectives add vexp.dummy dummy

#States
scoreboard objectives add vexp.state dummy
# Combo System
scoreboard objectives add vexp.combo dummy
scoreboard objectives add vexp.combo_cooldown dummy
scoreboard objectives add vexp.swoosh_ticks dummy
scoreboard objectives add vexp.hit_detected minecraft.custom:minecraft.damage_dealt
scoreboard objectives add vexp.stun_timer dummy
scoreboard objectives add vexp.right_click dummy
# Feedback
scoreboard objectives add vexp.damage_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add vexp.sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add vexp.wave_step dummy
scoreboard objectives add vexp.look_yaw dummy
scoreboard objectives add vexp.look_pitch dummy
scoreboard objectives add vexp.look_yaw_prev dummy
scoreboard objectives add vexp.look_pitch_prev dummy
scoreboard objectives add vexp.look_speed dummy
scoreboard objectives add vexp.look_dyaw dummy
scoreboard objectives add vexp.look_dpitch dummy

# Movement
scoreboard objectives add vexp.move_dash_cd dummy
scoreboard objectives add vexp.move_climb_cd dummy
scoreboard objectives add vexp.move_tap_w dummy
scoreboard objectives add vexp.move_tap_a dummy
scoreboard objectives add vexp.move_tap_s dummy
scoreboard objectives add vexp.move_tap_d dummy
scoreboard objectives add vexp.move_prev_w dummy
scoreboard objectives add vexp.move_prev_a dummy
scoreboard objectives add vexp.move_prev_s dummy
scoreboard objectives add vexp.move_prev_d dummy
scoreboard objectives add vexp.move_prev_sneak dummy
scoreboard objectives add vexp.move_slide_ticks dummy
scoreboard objectives add vexp.move_slide_dir dummy
scoreboard objectives add vexp.move_climb_ready dummy

# Weapon skills
scoreboard objectives add vexp.gauntlets_parry_timer dummy
scoreboard objectives add vexp.gauntlets_boost_timer dummy
scoreboard objectives add vexp.gauntlets_damage_snapshot dummy
scoreboard objectives add vexp.gauntlets_guard dummy
scoreboard objectives add vexp.sword_spin_timer dummy
# Dungeons System
scoreboard objectives add vexp.dstate dummy
scoreboard objectives add vexp.scythe_proj_life dummy

# Global Projectile System
scoreboard objectives add vexp.proj_lifetime dummy
scoreboard objectives add vexp.proj_speed dummy
scoreboard objectives add vexp.proj_gravity dummy
scoreboard objectives add vexp.proj_damage dummy

# Inicializar contador global de IDs solo en el debug

# Teams for Feedback Glowing
team add vexp.white
team modify vexp.white color gray
team add vexp.yellow
team modify vexp.yellow color yellow
team add vexp.red
team modify vexp.red color red
