# Mob flees away when hurted
# @s is the mob

execute store result score @s vexp.rand run random value 0..100

# Gravity when floating
execute if block ~ ~-0.5 ~ #replaceable run tp @s ~ ~-0.5 ~

# 1. Forward step on valid floor.
$execute if score @s vexp.rand matches ..49 unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^-1 ^1 #replaceable unless block ^ ^-1 ^1 #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable if block ^1 ^ ^1 #replaceable run return run tp @s ^ ^ ^$(speed) ~-45 ~
$execute if score @s vexp.rand matches 50.. unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^-1 ^1 #replaceable unless block ^ ^-1 ^1 #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable if block ^-1 ^ ^1 #replaceable run return run tp @s ^ ^ ^$(speed) ~45 ~

$execute if score @s vexp.rand matches ..49 unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^-1 ^1 #replaceable unless block ^ ^-1 ^1 #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable if block ^1 ^ ^1 #replaceable run return run tp @s ^ ^1 ^$(speed) ~-45 ~
$execute if score @s vexp.rand matches 50.. unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^-1 ^1 #replaceable unless block ^ ^-1 ^1 #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable if block ^-1 ^ ^1 #replaceable run return run tp @s ^ ^1 ^$(speed) ~45 ~

# 2. When facing a slightly front block or edge.
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable unless block ^ ^-1 ^1 #replaceable unless block ^ ^-1 ^1 #vexp:custom_mob_avoid_floor unless block ^1 ^ ^ #replaceable run return run tp @s ^-0.1 ^ ^$(speed) ~12.5 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable unless block ^ ^-1 ^1 #replaceable unless block ^ ^-1 ^1 #vexp:custom_mob_avoid_floor unless block ^-1 ^ ^ #replaceable run return run tp @s ^0.1 ^ ^$(speed) ~-12.5 ~

# 3. Controlled one-block descent at ledges.
$execute if score @s vexp.rand matches ..49 unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable if block ^ ^-1 ^1 #replaceable unless block ^ ^-2 ^1 #replaceable unless block ^ ^-2 ^1 #vexp:custom_mob_avoid_floor run return run tp @s ^ ^-0.5 ^$(speed) ~-45 ~
$execute if score @s vexp.rand matches 50.. unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable if block ^ ^-1 ^1 #replaceable unless block ^ ^-2 ^1 #replaceable unless block ^ ^-2 ^1 #vexp:custom_mob_avoid_floor run return run tp @s ^ ^-0.5 ^$(speed) ~45 ~

# 4. Upwards step when facing a solid block.
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable unless block ^1 ^1 ^1 #replaceable run return run tp @s ^ ^1 ^$(speed) ~45 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable unless block ^-1 ^1 ^1 #replaceable run return run tp @s ^ ^1 ^$(speed) ~-45 ~

# 5. Strafe to dodge frontal blockage.
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable if block ^1 ^ ^ #replaceable run return run tp @s ^0.2 ^ ^-$(speed) ~-22.5 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable if block ^-1 ^ ^ #replaceable run return run tp @s ^-0.2 ^ ^-$(speed) ~22.5 ~

$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable if block ^1 ^ ^ #replaceable if block ^2 ^ ^ #replaceable run return run tp @s ^1 ^ ^$(speed) ~-90 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable if block ^1 ^ ^ #replaceable unless block ^2 ^ ^ #replaceable run return run tp @s ^-0.5 ^ ^-$(speed) ~90 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable if block ^1 ^ ^ #replaceable unless block ^2 ^ ^ #replaceable unless block ^3 ^ ^ #replaceable run return run tp @s ^-1 ^ ^-$(speed) ~90 ~

$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable unless block ^1 ^ ^ #replaceable unless block ^2 ^ ^ #replaceable if block ^-1 ^ ^ #replaceable if block ^-2 ^ ^ #replaceable run return run tp @s ^-1 ^ ^$(speed) ~90 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable unless block ^1 ^ ^ #replaceable unless block ^2 ^ ^ #replaceable if block ^-1 ^ ^ #replaceable unless block ^-2 ^ ^ #replaceable run return run tp @s ^0.5 ^ ^-$(speed) ~-90 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable unless block ^1 ^ ^ #replaceable unless block ^2 ^ ^ #replaceable if block ^-1 ^ ^ #replaceable unless block ^-2 ^ ^ #replaceable unless block ^-3 ^ ^ #replaceable run return run tp @s ^0.5 ^ ^-$(speed) ~-90 ~

# 6. Strafe to no valid block.
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #vexp:custom_mob_avoid_floor if block ^1 ^ ^ #replaceable run return run tp @s ^0.5 ^ ^-$(speed) ~-45 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #vexp:custom_mob_avoid_floor if block ^-1 ^ ^ #replaceable run return run tp @s ^-0.5 ^ ^-$(speed) ~45 ~

$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #vexp:custom_mob_avoid_floor if block ^ ^1 ^1 #vexp:custom_mob_avoid_floor if block ^1 ^ ^ #replaceable run return run tp @s ^0.2 ^ ^-$(speed) ~-22.5 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #vexp:custom_mob_avoid_floor if block ^ ^1 ^1 #vexp:custom_mob_avoid_floor if block ^-1 ^ ^ #replaceable run return run tp @s ^-0.2 ^ ^-$(speed) ~22.5 ~

# 7. When trapped against one way backwards
execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable unless block ^1 ^ ^ #replaceable unless block ^-1 ^ ^ #replaceable if block ^ ^ ^-1 #replaceable run return run tp @s ^ ^ ^-1 ~180 ~
