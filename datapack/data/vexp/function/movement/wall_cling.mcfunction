# Wall cling
# Keep the player attached to the wall while holding sneak
# Collision-free cling: no helper entities, only movement dampening.
# Small upward nudge counters gravity while sneaking against the wall.
tp @s ~ ~.5 ~
effect give @s minecraft:slow_falling 1 255 true
particle minecraft:dust_plume ~ ~1 ~ 0 0 0 0.01 1
