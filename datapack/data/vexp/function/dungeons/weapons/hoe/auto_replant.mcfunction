#Crop macro

$execute positioned ~ ~ ~ if block ~ ~ ~ $(crop)[age=$(age)] run setblock ~ ~ ~ air destroy
$execute positioned ~ ~ ~ if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:$(item)"}},limit=1] if block ~ ~-1 ~ farmland run setblock ~ ~ ~ $(crop)

$execute positioned ~ ~ ~1 if block ~ ~ ~ $(crop)[age=$(age)] run setblock ~ ~ ~ air destroy
$execute positioned ~ ~ ~1 if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:$(item)"}},limit=1] if block ~ ~-1 ~ farmland run setblock ~ ~ ~ $(crop)

$execute positioned ~ ~ ~-1 if block ~ ~ ~ $(crop)[age=$(age)] run setblock ~ ~ ~ air destroy
$execute positioned ~ ~ ~-1 if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:$(item)"}},limit=1] if block ~ ~-1 ~ farmland run setblock ~ ~ ~ $(crop)

$execute positioned ~1 ~ ~ if block ~ ~ ~ $(crop)[age=$(age)] run setblock ~ ~ ~ air destroy
$execute positioned ~1 ~ ~ if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:$(item)"}},limit=1] if block ~ ~-1 ~ farmland run setblock ~ ~ ~ $(crop)

$execute positioned ~-1 ~ ~ if block ~ ~ ~ $(crop)[age=$(age)] run setblock ~ ~ ~ air destroy
$execute positioned ~-1 ~ ~ if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:$(item)"}},limit=1] if block ~ ~-1 ~ farmland run setblock ~ ~ ~ $(crop)

$execute positioned ~1 ~ ~1 if block ~ ~ ~ $(crop)[age=$(age)] run setblock ~ ~ ~ air destroy
$execute positioned ~1 ~ ~1 if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:$(item)"}},limit=1] if block ~ ~-1 ~ farmland run setblock ~ ~ ~ $(crop)

$execute positioned ~1 ~ ~-1 if block ~ ~ ~ $(crop)[age=$(age)] run setblock ~ ~ ~ air destroy
$execute positioned ~1 ~ ~-1 if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:$(item)"}},limit=1] if block ~ ~-1 ~ farmland run setblock ~ ~ ~ $(crop)

$execute positioned ~-1 ~ ~-1 if block ~ ~ ~ $(crop)[age=$(age)] run setblock ~ ~ ~ air destroy
$execute positioned ~-1 ~ ~-1 if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:$(item)"}},limit=1] if block ~ ~-1 ~ farmland run setblock ~ ~ ~ $(crop)
