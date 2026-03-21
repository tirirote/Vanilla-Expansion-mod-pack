# dungeons/gauntlets/echo/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob


# Effects
execute as @p[tag=vexp.attacker,limit=1] run effect give @s minecraft:slowness 2 2 true

# Knockback {strength:0.25, y:0.2}
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}

particle minecraft:sculk_charge_pop ~ ~1 ~ 0.2 0.2 0.2 0.02 3
particle minecraft:large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.02 3
function vexp:utils/sound {sound: "minecraft:entity.player.attack.strong", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
