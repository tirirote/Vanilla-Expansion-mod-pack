# dungeons/combo_system/hooks/revoke_attack_advancement.mcfunction
# @s is the player
# Revokes the advancement for the current item type

$advancement revoke @s only vexp:event/$(item)_attack
