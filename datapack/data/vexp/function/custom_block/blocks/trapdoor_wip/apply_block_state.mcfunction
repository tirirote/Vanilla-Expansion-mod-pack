# apply_block_state.mcfunction
# Aplica el estado persistente trap_facing/trap_half/trap_open a la hitbox iron_trapdoor.

execute if data entity @s data.vexp{trap_facing:"north",trap_half:"bottom",trap_open:0b} run setblock ~ ~ ~ iron_trapdoor[facing=north,half=bottom,open=false,powered=false]
execute if data entity @s data.vexp{trap_facing:"south",trap_half:"bottom",trap_open:0b} run setblock ~ ~ ~ iron_trapdoor[facing=south,half=bottom,open=false,powered=false]
execute if data entity @s data.vexp{trap_facing:"east",trap_half:"bottom",trap_open:0b} run setblock ~ ~ ~ iron_trapdoor[facing=east,half=bottom,open=false,powered=false]
execute if data entity @s data.vexp{trap_facing:"west",trap_half:"bottom",trap_open:0b} run setblock ~ ~ ~ iron_trapdoor[facing=west,half=bottom,open=false,powered=false]

execute if data entity @s data.vexp{trap_facing:"north",trap_half:"top",trap_open:0b} run setblock ~ ~ ~ iron_trapdoor[facing=north,half=top,open=false,powered=false]
execute if data entity @s data.vexp{trap_facing:"south",trap_half:"top",trap_open:0b} run setblock ~ ~ ~ iron_trapdoor[facing=south,half=top,open=false,powered=false]
execute if data entity @s data.vexp{trap_facing:"east",trap_half:"top",trap_open:0b} run setblock ~ ~ ~ iron_trapdoor[facing=east,half=top,open=false,powered=false]
execute if data entity @s data.vexp{trap_facing:"west",trap_half:"top",trap_open:0b} run setblock ~ ~ ~ iron_trapdoor[facing=west,half=top,open=false,powered=false]

execute if data entity @s data.vexp{trap_facing:"north",trap_half:"bottom",trap_open:1b} run setblock ~ ~ ~ iron_trapdoor[facing=north,half=bottom,open=true,powered=false]
execute if data entity @s data.vexp{trap_facing:"south",trap_half:"bottom",trap_open:1b} run setblock ~ ~ ~ iron_trapdoor[facing=south,half=bottom,open=true,powered=false]
execute if data entity @s data.vexp{trap_facing:"east",trap_half:"bottom",trap_open:1b} run setblock ~ ~ ~ iron_trapdoor[facing=east,half=bottom,open=true,powered=false]
execute if data entity @s data.vexp{trap_facing:"west",trap_half:"bottom",trap_open:1b} run setblock ~ ~ ~ iron_trapdoor[facing=west,half=bottom,open=true,powered=false]

execute if data entity @s data.vexp{trap_facing:"north",trap_half:"top",trap_open:1b} run setblock ~ ~ ~ iron_trapdoor[facing=north,half=top,open=true,powered=false]
execute if data entity @s data.vexp{trap_facing:"south",trap_half:"top",trap_open:1b} run setblock ~ ~ ~ iron_trapdoor[facing=south,half=top,open=true,powered=false]
execute if data entity @s data.vexp{trap_facing:"east",trap_half:"top",trap_open:1b} run setblock ~ ~ ~ iron_trapdoor[facing=east,half=top,open=true,powered=false]
execute if data entity @s data.vexp{trap_facing:"west",trap_half:"top",trap_open:1b} run setblock ~ ~ ~ iron_trapdoor[facing=west,half=top,open=true,powered=false]
