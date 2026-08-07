# Try to move once
# @s is the custom mob

# Abort early when no valid target exists.
$execute unless entity @e[tag=$(target_tag),sort=nearest,limit=1,distance=..32] run return 0

# Gravity when floating
execute if block ~ ~-0.5 ~ #replaceable run tp @s ~ ~-0.5 ~

# 0. Priority when mob is inside a block
execute unless block ~ ~0.5 ~ #replaceable if block ^0.5 ^ ^ #replaceable run return run tp @s ^0.2 ^ ^0.2 ~-45 ~
execute unless block ~ ~0.5 ~ #replaceable unless block ^0.5 ^ ^ #replaceable if block ^-0.2 ^ ^0.2 #replaceable run return run tp @s ^-0.5 ^ ^ ~45 ~

execute unless block ~ ~0.5 ~ #replaceable if block ^ ^0.5 ^ #replaceable run return run tp @s ^ ^0.2 ^ ~ ~
execute unless block ~ ~0.5 ~ #replaceable unless block ^ ^0.5 ^ #replaceable if block ^ ^-0.5 ^ #replaceable run return run tp @s ^ ^-0.2 ^ ~ ~-45

execute unless block ~ ~0.5 ~ #replaceable unless block ^ ^ ^0.5 #replaceable unless block ^ ^0.5 ^0.5 #replaceable run return run tp @s ^ ^ ^-0.2
execute unless block ~ ~0.5 ~ #replaceable unless block ^ ^ ^-0.5 #replaceable unless block ^ ^0.5 ^0.5 #replaceable run return run tp @s ^ ^ ^0.2

# 1. Forward step on valid floor.
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable unless block ^ ^-1 ^1 #replaceable unless block ^ ^-1 ^1 #vexp:custom_mob_avoid_floor run return run tp @s ^ ^ ^$(speed) facing entity @e[tag=$(target_tag),sort=nearest,limit=1]

# 1b. Controlled one-block descent at ledges.
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable if block ^ ^-1 ^1 #replaceable unless block ^ ^-2 ^1 #replaceable unless block ^ ^-2 ^1 #vexp:custom_mob_avoid_floor run return run tp @s ^ ^-0.5 ^$(speed) facing entity @e[tag=$(target_tag),sort=nearest,limit=1]

# 2. When facing a slightly front block or edge.
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable unless block ^ ^-1 ^1 #replaceable unless block ^ ^-1 ^1 #vexp:custom_mob_avoid_floor unless block ^1 ^ ^ #replaceable run return run tp @s ^-0.1 ^ ^$(speed) ~12.5 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable unless block ^ ^-1 ^1 #replaceable unless block ^ ^-1 ^1 #vexp:custom_mob_avoid_floor unless block ^-1 ^ ^ #replaceable run return run tp @s ^0.1 ^ ^$(speed) ~-12.5 ~

# 3. Upwards step when facing a solid block.
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable unless block ^ ^-1 ^1 #replaceable run return run tp @s ^ ^0.5 ^$(speed)

$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable unless block ^ ^-1 ^1 #replaceable if block ^1 ^1 ^1 #replaceable run return run tp @s ^ ^0.5 ^$(speed) ~12.5 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable unless block ^ ^-1 ^1 #replaceable if block ^-1 ^1 ^1 #replaceable run return run tp @s ^ ^0.5 ^$(speed) ~-12.5 ~

# 4. Strafe to dodge frontal blockage.
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable if block ^1 ^ ^ #replaceable run return run tp @s ^0.2 ^ ^-$(speed) ~-22.5 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable if block ^-1 ^ ^ #replaceable run return run tp @s ^-0.2 ^ ^-$(speed) ~22.5 ~

$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable if block ^1 ^ ^ #replaceable if block ^2 ^ ^ #replaceable run return run tp @s ^1 ^ ^$(speed) ~-90 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable if block ^1 ^ ^ #replaceable unless block ^2 ^ ^ #replaceable run return run tp @s ^-0.5 ^ ^-$(speed) ~90 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable if block ^1 ^ ^ #replaceable unless block ^2 ^ ^ #replaceable unless block ^3 ^ ^ #replaceable run return run tp @s ^-1 ^ ^-$(speed) ~90 ~

$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable unless block ^1 ^ ^ #replaceable unless block ^2 ^ ^ #replaceable if block ^-1 ^ ^ #replaceable if block ^-2 ^ ^ #replaceable run return run tp @s ^-1 ^ ^$(speed) ~90 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable unless block ^1 ^ ^ #replaceable unless block ^2 ^ ^ #replaceable if block ^-1 ^ ^ #replaceable unless block ^-2 ^ ^ #replaceable run return run tp @s ^0.5 ^ ^-$(speed) ~-90 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable unless block ^1 ^ ^ #replaceable unless block ^2 ^ ^ #replaceable if block ^-1 ^ ^ #replaceable unless block ^-2 ^ ^ #replaceable unless block ^-3 ^ ^ #replaceable run return run tp @s ^0.5 ^ ^-$(speed) ~-90 ~

# 5. Strafe to no valid block.
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #vexp:custom_mob_avoid_floor if block ^1 ^ ^ #replaceable run return run tp @s ^0.2 ^ ^-$(speed) ~-22.5 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #vexp:custom_mob_avoid_floor if block ^-1 ^ ^ #replaceable run return run tp @s ^-0.2 ^ ^-$(speed) ~22.5 ~

$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #vexp:custom_mob_avoid_floor if block ^ ^1 ^1 #vexp:custom_mob_avoid_floor if block ^1 ^ ^ #replaceable run return run tp @s ^0.2 ^ ^-$(speed) ~-22.5 ~
$execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor if block ^ ^ ^1 #vexp:custom_mob_avoid_floor if block ^ ^1 ^1 #vexp:custom_mob_avoid_floor if block ^-1 ^ ^ #replaceable run return run tp @s ^-0.2 ^ ^-$(speed) ~22.5 ~

# 6. When trapped against one way backwards
execute unless block ~ ~-0.5 ~ #replaceable unless block ~ ~-0.5 ~ #vexp:custom_mob_avoid_floor unless block ^ ^ ^1 #replaceable unless block ^ ^1 ^1 #replaceable unless block ^1 ^ ^ #replaceable unless block ^-1 ^ ^ #replaceable if block ^ ^ ^-1 #replaceable run return run tp @s ^ ^ ^-1 ~180 ~
