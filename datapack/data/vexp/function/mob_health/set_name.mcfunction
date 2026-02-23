# This macro sets the fallback selector using the real ID
# $(id) is replaced by the actual numeric ID of the mob
$data modify storage vexp:temp Bar.name set value {selector:"@e[scores={vexp.id=$(id)},limit=1,type=!text_display,type=!armor_stand]"}
