# Hit animation
execute if entity @e[type=vindicator,tag=vexp.custom_block.dummy_mob,distance=..1,limit=1,nbt={HurtTime:10s}] run data modify entity @s transformation.left_rotation set value [0f,1f,0.101f,0f]

execute if entity @e[type=vindicator,tag=vexp.custom_block.dummy_mob,distance=..1,limit=1,nbt={HurtTime:10s}] run particle block{block_state:"hay_block"} ~ ~1 ~ 0.2 0.2 0.2 .5 10

execute if entity @e[type=vindicator,tag=vexp.custom_block.dummy_mob,distance=..1,limit=1,nbt={HurtTime:7s}] run data modify entity @s transformation.left_rotation set value [0f,1f,-0.05f,0f]


execute if entity @e[type=vindicator,tag=vexp.custom_block.dummy_mob,distance=..1,limit=1,nbt={HurtTime:5s}] run data modify entity @s transformation.left_rotation set value [0f,1f,0.02f,0f]

# Reposo original (HurtTime 1) -> Pitch 0
execute if entity @e[type=vindicator,tag=vexp.custom_block.dummy_mob,distance=..1,limit=1,nbt={HurtTime:1s}] run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]
