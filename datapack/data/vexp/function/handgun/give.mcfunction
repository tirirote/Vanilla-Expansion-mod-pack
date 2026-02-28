# Dar el arma con componentes de la 1.21
# damage=0 significa cargador lleno. max_damage=6 es el límite.
give @s carrot_on_a_stick[max_damage=300, damage=0,custom_data={vexp:{type:"handgun",ammo:6}}, custom_model_data={strings:["vexp:handgun"]}, item_name={"text":"Cañón de Mano","color":"white","italic":false}, lore=[{"text":"Munición: 6 / 6","color":"gray","italic":false}],minecraft:repairable={items:'minecraft:iron_ingot'},attribute_modifiers=[{id:"minecraft:attack_speed",amount:-3.0f,operation:add_value,slot:mainhand,type:"attack_speed"}]] 1

# Inicializar el scoreboard de uso si no existe
scoreboard objectives add vexp.use_gun minecraft.used:minecraft.carrot_on_a_stick
