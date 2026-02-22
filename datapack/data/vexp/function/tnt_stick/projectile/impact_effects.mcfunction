# Impact Effects (Sound & Particles)
# Ejecutado AT @s (marker) AS @s
# Basado en los efectos de las dagas

# Sonido base de impacto (como el tridente pero más suave)
playsound minecraft:block.grass.place ambient @a[distance=..10] ~ ~ ~ 1 0.5

# 1. PIEDRA / MINERALES (#minecraft:mineable/pickaxe)
execute if block ~ ~-0.5 ~ #minecraft:mineable/pickaxe run playsound minecraft:block.stone.break player @a[distance=..10] ~ ~ ~ 0.8 1.2
execute if block ~ ~-0.5 ~ #minecraft:mineable/pickaxe run particle block{block_state:{Name:"minecraft:stone"}} ~ ~ ~ 0.2 0.1 0.2 0.1 15

# 2. MADERA / TRONCOS (#minecraft:mineable/axe)
execute if block ~ ~-0.5 ~ #minecraft:mineable/axe run playsound minecraft:block.wood.break player @a[distance=..10] ~ ~ ~ 0.8 1.2
execute if block ~ ~-0.5 ~ #minecraft:mineable/axe run particle block{block_state:{Name:"minecraft:oak_planks"}} ~ ~ ~ 0.2 0.1 0.2 0.1 15

# 3. TIERRA / ARENA / GRAVA (#minecraft:mineable/shovel)
execute if block ~ ~-0.5 ~ #minecraft:mineable/shovel run playsound minecraft:block.grass.break player @a[distance=..10] ~ ~ ~ 0.8 1.2
execute if block ~ ~-0.5 ~ #minecraft:mineable/shovel run particle block{block_state:{Name:"minecraft:dirt"}} ~ ~ ~ 0.2 0.1 0.2 0.1 15

# 4. HOJAS / LANA / PLANTA (Generic/Soft)
execute if block ~ ~-0.5 ~ #minecraft:mineable/hoe run playsound minecraft:block.grass.break player @a[distance=..10] ~ ~ ~ 0.5 1.5
execute if block ~ ~-0.5 ~ #minecraft:mineable/hoe run particle block{block_state:{Name:"minecraft:short_grass"}} ~ ~ ~ 0.2 0.1 0.2 0.1 10

# 5. METAL / FALLBACK
execute unless block ~ ~-0.5 ~ #minecraft:mineable/pickaxe unless block ~ ~-0.5 ~ #minecraft:mineable/axe unless block ~ ~-0.5 ~ #minecraft:mineable/shovel unless block ~ ~-0.5 ~ #minecraft:mineable/hoe run playsound minecraft:block.anvil.hit player @a[distance=..10] ~ ~ ~ 0.3 1.5
