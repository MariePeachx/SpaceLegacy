execute if entity @s[tag=sl_kit] run return 0
tag @s add sl_kit
give @s ad_astra:tier_1_rocket
give @s ad_astra:launch_pad
give @s ad_astra:fuel_bucket 3
function spacelegacy:adastra/suit
tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Te he dejado un cohete, una plataforma de lanzamiento, combustible y un traje con oxígeno. No preguntes de dónde los he sacado.","color":"white"}]
tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Pon la plataforma en el suelo, el cohete encima, échale los 3 cubos de combustible, súbete y mantén ESPACIO. En el menú elige la Luna. ","color":"white"},{"text":"O si tienes prisa: ","color":"gray"},{"text":"[viaje rápido]","color":"green","underlined":true,"clickEvent":{"action":"run_command","value":"/trigger luna"}}]
