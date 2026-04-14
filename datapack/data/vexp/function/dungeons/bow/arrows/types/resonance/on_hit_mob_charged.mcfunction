# dungeons/bow/arrows/types/resonance/on_hit_mob_charged.mcfunction
# @s is a resonance-quality bow arrow, fully charged, hitting a mob

particle minecraft:sculk_soul ~ ~1 ~ 0.2 0.2 0.2 0.02 8
particle minecraft:sculk_charge_pop ~ ~1 ~ 0.15 0.15 0.15 0.01 5
particle minecraft:explosion ~ ~1 ~ 0.35 0.35 0.35 0.05 5
particle minecraft:sculk_charge_pop ~ ~1 ~ 0.25 0.25 0.25 0.02 8
particle minecraft:large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.05 6
function vexp:utils/sound {sound: "minecraft:entity.warden.sonic_charge", type: "player"}
