# Modify target follow range
$execute if entity @s[type=#vexp:can_become_angry] run data modify entity @s angry_at set value $(UUID)
execute if entity @s[type=#vexp:bone_armor_friends] run team join vexp.bone_armor_friend

# Feedback
particle entity_effect{color:1740683161} ~ ~ ~ 0.2 0 0.2 0 1
tag @s add vexp.bone_modifier
