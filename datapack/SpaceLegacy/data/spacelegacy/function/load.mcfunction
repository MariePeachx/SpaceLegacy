scoreboard objectives add sl_global dummy
scoreboard objectives add luna trigger
scoreboard objectives add tierra trigger
scoreboard objectives add base trigger
scoreboard objectives add expedientes trigger
scoreboard objectives add sl_resp trigger
scoreboard objectives add sl_x dummy
scoreboard objectives add sl_y dummy
scoreboard objectives add sl_z dummy
scoreboard objectives add sl_ecos dummy
scoreboard objectives add sl_sec dummy
scoreboard players set #9 sl_global 9
scoreboard players set #2 sl_global 2
# ¿Está Ad Astra instalado?
scoreboard players set #adastra sl_global 0
function #spacelegacy:adastra_detect
schedule function spacelegacy:second 20t replace
schedule function spacelegacy:fx 10t replace
schedule function spacelegacy:slow 600t replace
# Si el mundo viene de una versión anterior del pack, se reconstruye todo
execute unless score #version sl_global matches 3 run scoreboard players set #built sl_global 0
scoreboard players set #version sl_global 3
execute unless score #built sl_global matches 1 run schedule function spacelegacy:setup/attempt 40t replace
