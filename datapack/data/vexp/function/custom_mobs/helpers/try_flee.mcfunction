# Mob flees away when hurted
# @s is the mob

execute store result score @s vexp.rand run random value 0..100

# Gravity when floating
$execute if block ~ ~-$(height) ~ #replaceable run tp @s ~ ~-0.25 ~

$execute if score @s vexp.rand matches ..49 unless block ~ ~-$(height) ~ #replaceable if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^$(speed) ~45 ~
$execute if score @s vexp.rand matches 50.. unless block ~ ~-$(height) ~ #replaceable if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^$(speed) ~-45 ~

$execute unless block ~ ~-$(height) ~ #replaceable if block ^ ^ ^1 #replaceable unless block ^0.5 ^ ^1 #replaceable run tp @s ^ ^ ^$(speed) ~45 ~
$execute unless block ~ ~-$(height) ~ #replaceable if block ^ ^ ^1 #replaceable unless block ^-0.5 ^ ^1 #replaceable run tp @s ^ ^ ^$(speed) ~-45 ~

$execute if score @s vexp.rand matches ..49 unless block ~ ~-$(height) ~ #replaceable unless block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable run tp @s ^ ^0.5 ^$(speed) ~45 ~
$execute if score @s vexp.rand matches 50.. unless block ~ ~-$(height) ~ #replaceable unless block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable run tp @s ^ ^0.5 ^$(speed) ~-45 ~

$execute unless block ~ ~-$(height) ~ #replaceable unless block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable unless block ^0.5 ^1 ^1 #replaceable run tp @s ^ ^0.5 ^$(speed) ~45 ~
$execute unless block ~ ~-$(height) ~ #replaceable unless block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable unless block ^-0.5 ^1 ^1 #replaceable run tp @s ^ ^0.5 ^$(speed) ~-45 ~
