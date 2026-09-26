# Spider-based custom mob candidates (evaluated once per entity lifetime).
# @s is a freshly spawned spider.
tag @s add vexp.natural_mob_checked

execute unless entity @s[tag=vexp.custom_mob] run function vexp:custom_mobs/natural_spawn/mobs/webbing_spider
