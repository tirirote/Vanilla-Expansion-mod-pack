# vexp:feedback/tick
# Global feedback loop for combat readability.

# Enemy attack-ready feedback check (timer-based per enemy family)
#execute as @e[predicate=vexp:is_target,type=!player] unless entity @s[tag=vexp.custom_block.dummy_mob] at @s run function vexp:feedback/enemy_attack_ready_timer

# Player feedback
function vexp:feedback/player/feedback
