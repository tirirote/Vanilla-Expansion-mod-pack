particle minecraft:large_smoke ~ ~ ~ 0.2 0.2 0.2 0.2 10
function vexp:utils/sound {sound: "minecraft:entity.generic.explode", type: "player"}
function vexp:utils/deal_damage {damage: 2, type: "player", owner: "@p[tag=vexp.attacker]"}