# Execute if the block candidate is a log
# @s is the player
execute positioned ~ ~ ~ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~-1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy

execute positioned ~ ~1 ~ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~1 ~1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~1 ~-1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~-1 ~ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~-1 ~1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~-1 ~-1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy

execute positioned ~1 ~ ~ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~ ~1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~1 ~ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~1 ~1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~1 ~-1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~-1 ~ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~-1 ~1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~-1 ~-1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy

execute positioned ~-1 ~ ~ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~1 ~ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~1 ~1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~1 ~-1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~-1 ~ if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~-1 ~1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~-1 ~-1 if block ~ ~ ~ #vexp:axe_targets run setblock ~ ~ ~ air destroy
