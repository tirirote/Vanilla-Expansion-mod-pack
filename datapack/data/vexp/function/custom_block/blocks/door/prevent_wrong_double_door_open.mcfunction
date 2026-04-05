setblock ~ ~ ~ iron_door[half=lower,open=false] strict
setblock ~ ~1 ~ iron_door[half=upper,open=false] strict
stopsound @a[distance=..10] * block.iron_door.open
stopsound @a[distance=..10] * block.iron_door.close
