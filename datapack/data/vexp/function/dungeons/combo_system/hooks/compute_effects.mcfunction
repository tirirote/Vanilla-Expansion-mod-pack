# dungeons/combo_system/hooks/compute_effects.mcfunction
# @s is the player (attacker)
# Reads combo_params.damage and combo_params.cooldown, applies vanilla effect
# modifiers, and writes eff_damage (float) and eff_cooldown (int) back to storage.

# ── Base values ────────────────────────────────────────────────────────────────
# Load damage with x10 scale for 1-decimal float precision (e.g. 6.0 → 60)
execute store result score #eff_dmg vexp.math run data get storage vexp:dungeons.weapon combo_params.damage 10
# Load cooldown as-is (integer ticks)
execute store result score #eff_cd vexp.math run data get storage vexp:dungeons.weapon combo_params.cooldown 1

# ── Damage modifiers ───────────────────────────────────────────────────────────
# Strength I/II: +(amplifier+1)*3 per level
execute if entity @s[nbt={active_effects:[{id:"minecraft:strength"}]}] run function vexp:dungeons/combo_system/effects/apply_strength

# Weakness I/II: -(amplifier+1)*4 per level
execute if entity @s[nbt={active_effects:[{id:"minecraft:weakness"}]}] run function vexp:dungeons/combo_system/effects/apply_weakness

# Jump critical: +15% damage based on current pre-critical damage.
scoreboard players set #crit_bonus vexp.math 0
scoreboard players set #const_15 vexp.math 15
scoreboard players set #const_100 vexp.math 100
execute if entity @s[tag=vexp.hit_critical] run scoreboard players operation #crit_bonus vexp.math = #eff_dmg vexp.math
execute if entity @s[tag=vexp.hit_critical] run scoreboard players operation #crit_bonus vexp.math *= #const_15 vexp.math
execute if entity @s[tag=vexp.hit_critical] run scoreboard players operation #crit_bonus vexp.math /= #const_100 vexp.math
execute if entity @s[tag=vexp.hit_critical] run scoreboard players operation #eff_dmg vexp.math += #crit_bonus vexp.math

# Floor damage at 1 (= 0.1 final damage)
execute if score #eff_dmg vexp.math matches ..0 run scoreboard players set #eff_dmg vexp.math 1

# ── Cooldown modifiers ─────────────────────────────────────────────────────────
# Haste I/II: -(amplifier+1)*2 ticks per level
execute if entity @s[nbt={active_effects:[{id:"minecraft:haste"}]}] run function vexp:dungeons/combo_system/effects/apply_haste

# Mining Fatigue I/II: +(amplifier+1)*3 ticks per level
execute if entity @s[nbt={active_effects:[{id:"minecraft:mining_fatigue"}]}] run function vexp:dungeons/combo_system/effects/apply_mining_fatigue

# Floor cooldown at 1 tick
execute if score #eff_cd vexp.math matches ..0 run scoreboard players set #eff_cd vexp.math 1

# ── Write back to storage ──────────────────────────────────────────────────────
execute store result storage vexp:dungeons.weapon combo_params.eff_damage float 0.1 run scoreboard players get #eff_dmg vexp.math
execute store result storage vexp:dungeons.weapon combo_params.eff_cooldown int 1 run scoreboard players get #eff_cd vexp.math
