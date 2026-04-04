# utils/feedback/swoosh/spawn_trail.mcfunction
# @s is the player
# Params: $(item_id), $(model)
# One simple trail per frame with age 0 - maximum temporal resolution.

$function vexp:utils/feedback/swoosh/spawn {item_id:"$(item_id)",model:"$(model)",sx:4.0f,sy:1.0f,sz:0.0f,dist:0.0f,delay_frame:0}
$function vexp:utils/feedback/swoosh/spawn {item_id:"$(item_id)",model:"$(model)",sx:4.0f,sy:1.0f,sz:0.0f,dist:0.0f,delay_frame:0}
