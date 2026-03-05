# This macro sets the fallback selector using the real ID
# $(id) is replaced by the actual numeric ID of the mob
$data modify storage vexp:temp Bar.name set value {selector:"@e[scores={vexp.id=$(id)},sort=nearest,limit=1,type=!text_display,type=!armor_stand,type=!item_display,type=!block_display,type=!interaction,type=!item_frame,type=!glow_item_frame,type=!experience_orb,type=!marker,type=!area_effect_cloud,type=!player,type=!item]"}
