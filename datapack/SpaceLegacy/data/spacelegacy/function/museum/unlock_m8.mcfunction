execute if score #m8 sl_global matches 1 run return 0
scoreboard players set #m8 sl_global 1
function spacelegacy:museum/show_m8
tellraw @a ["",{"text":"[MUSEO] ","color":"gold","bold":true},{"text":"Nueva pieza en exposición: Vikram y Pragyan.","color":"white"}]
