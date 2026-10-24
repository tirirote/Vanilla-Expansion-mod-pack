# Break target blocks
execute positioned ~ ~ ~ if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~1 if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~ ~ if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~ ~1 if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~-1 if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
