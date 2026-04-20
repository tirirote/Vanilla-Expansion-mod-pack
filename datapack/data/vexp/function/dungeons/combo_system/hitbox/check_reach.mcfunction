# dungeons/combo_system/hitbox/check_reach.mcfunction
# @s is the hitbox. Called from evaluate_summon, where #combo_owner_id is already cached.

# Unmark from global removal
tag @s remove vexp.hitbox.to_remove

# Mark owning player as "found hitbox". Use ID-based lookup — @p sort=nearest is
# fragile in multiplayer when two players' hitboxes are near each other.
execute if entity @s as @a[tag=vexp.combo_user,distance=..15] if score @s vexp.id = #combo_owner_id vexp.id run tag @s add vexp.hitbox.found
