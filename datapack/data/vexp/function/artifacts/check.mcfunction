# Activate artifact by type

# Tick Check
execute unless entity @s[tag=vexp.artifact_activate] if items entity @s weapon.offhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] at @s run function vexp:artifacts/check_slot {slot:"weapon.offhand"}
execute unless entity @s[tag=vexp.artifact_activate] if items entity @s weapon.mainhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] at @s run function vexp:artifacts/check_slot {slot:"weapon.mainhand"}
