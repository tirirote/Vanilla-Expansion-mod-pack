# Impact Effects (Sound & Particles)
# Ejecutado AT el punto de impacto exacto

playsound minecraft:item.trident.hit player @a[distance=..10] ~ ~ ~ 1 1

# 1. PIEDRA / MINERALES (#minecraft:mineable/pickaxe)
execute if block ~ ~ ~ #minecraft:mineable/pickaxe run playsound minecraft:block.stone.break player @a[distance=..10] ~ ~ ~ 0.8 1.2
execute if block ~ ~ ~ #minecraft:mineable/pickaxe run particle block{block_state:{Name:"minecraft:stone"}} ~ ~ ~ 0.2 0.2 0.2 0.1 15

# 2. MADERA / TRONCOS (#minecraft:mineable/axe)
execute if block ~ ~ ~ #minecraft:mineable/axe run playsound minecraft:block.wood.break player @a[distance=..10] ~ ~ ~ 0.8 1.2
execute if block ~ ~ ~ #minecraft:mineable/axe run particle block{block_state:{Name:"minecraft:oak_planks"}} ~ ~ ~ 0.2 0.2 0.2 0.1 15

# 3. TIERRA / ARENA / GRAVA (#minecraft:mineable/shovel)
execute if block ~ ~ ~ #minecraft:mineable/shovel run playsound minecraft:block.grass.break player @a[distance=..10] ~ ~ ~ 0.8 1.2
execute if block ~ ~ ~ #minecraft:mineable/shovel run particle block{block_state:{Name:"minecraft:dirt"}} ~ ~ ~ 0.2 0.2 0.2 0.1 15

# 4. HOJAS / LANA / PLANTA (Generic/Soft)
execute if block ~ ~ ~ #minecraft:mineable/hoe run playsound minecraft:block.grass.break player @a[distance=..10] ~ ~ ~ 0.5 1.5
execute if block ~ ~ ~ #minecraft:mineable/hoe run particle block{block_state:{Name:"minecraft:short_grass"}} ~ ~ ~ 0.2 0.2 0.2 0.1 10

# 5. METAL / YUNQUE (Fallback para otros)
execute unless block ~ ~ ~ #minecraft:mineable/pickaxe unless block ~ ~ ~ #minecraft:mineable/axe unless block ~ ~ ~ #minecraft:mineable/shovel unless block ~ ~ ~ #minecraft:mineable/hoe run playsound minecraft:block.anvil.hit player @a[distance=..10] ~ ~ ~ 0.5 1.5
    