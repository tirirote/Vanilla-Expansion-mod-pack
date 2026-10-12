# Activate artifact by type
# Check
$execute if items entity @s $(slot) totem_of_undying[!custom_model_data] at @s run function vexp:artifacts/check/totem
$execute if items entity @s $(slot) totem_of_undying[custom_model_data={strings:["vexp:chalice"]}] at @s run function vexp:artifacts/check/chalice
$execute if items entity @s $(slot) totem_of_undying[custom_model_data={strings:["vexp:mask"]}] at @s run function vexp:artifacts/check/mask
$execute if items entity @s $(slot) totem_of_undying[custom_model_data={strings:["vexp:medallion"]}] at @s run function vexp:artifacts/check/medallion
$execute if items entity @s $(slot) totem_of_undying[custom_model_data={strings:["vexp:mirror"]}] at @s run function vexp:artifacts/check/mirror
$execute if items entity @s $(slot) totem_of_undying[custom_model_data={strings:["vexp:ring"]}] at @s run function vexp:artifacts/check/ring
$execute if items entity @s $(slot) totem_of_undying[custom_model_data={strings:["vexp:scarab"]}] at @s run function vexp:artifacts/check/scarab
