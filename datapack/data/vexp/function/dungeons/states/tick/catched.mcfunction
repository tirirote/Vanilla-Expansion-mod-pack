# Move only if destination space is open at feet/head to avoid burying the mob in blocks
execute at @p[tag=vexp.catch.owner,limit=1] positioned ~ ~1.5 ~ positioned ^ ^ ^3.5 if block ^ ^ ^ #replaceable if block ^ ^1 ^ #replaceable if block ^ ^-1 ^ #replaceable if block ^1 ^ ^ #replaceable if block ^-1 ^ ^ #replaceable run tp @s ~ ~ ~
