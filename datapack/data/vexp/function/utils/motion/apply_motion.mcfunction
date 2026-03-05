# apply_motion.mcfunction
# Macro para aplicar un vector de movimiento específico a @s
# Input: $(x), $(y), $(z)

$data modify entity @s Motion set value [$(x)d, $(y)d, $(z)d]
