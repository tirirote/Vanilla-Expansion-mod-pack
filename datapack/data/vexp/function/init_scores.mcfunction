# Inicialización de Scoreboards
scoreboard objectives add vexp.id dummy
scoreboard objectives add vexp.dagger_used minecraft.used:minecraft.iron_sword
scoreboard objectives add vexp.dagger_cooldown dummy
scoreboard objectives add vexp.fuse dummy
scoreboard objectives add vexp.damage dummy
scoreboard objectives add vexp.tnt_stick_used minecraft.used:minecraft.snowball

#Resetear ID
scoreboard players set #global vexp.id 0
