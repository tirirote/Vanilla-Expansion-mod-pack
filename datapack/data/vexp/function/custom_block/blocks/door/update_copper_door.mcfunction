# Update copper door with new data

scoreboard players operation #door_id vexp.id = @s vexp.id

$data modify entity @s data.vexp.item_name set value "$(name)"
$data modify entity @s data.vexp.name set value "$(name)"
$data modify entity @s data.vexp.model set value "$(model)"
$data modify entity @s data.vexp.p_break set value "$(p_break)"

$function vexp:custom_block/blocks/door/update_display_model_macro {name: "$(model)"}
