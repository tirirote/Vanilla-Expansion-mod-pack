# Dar el arma con componentes de la 1.21
# damage=0 significa cargador lleno. max_damage=6 es el límite.
give @s carrot_on_a_stick[max_damage=6, damage=0,custom_data={vexp:{type:"handgun"}}, custom_model_data={strings:["vexp:handgun"]}, item_name={"text":"Cañón de Mano","color":"gold","italic":false}, lore=['{"text":"Munición: 6 / 6","color":"gray","italic":false}']] 1

# Inicializar el scoreboard de uso si no existe
scoreboard objectives add vexp.use_gun minecraft.used:minecraft.carrot_on_a_stick
