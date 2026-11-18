execute if score #m9 sl_global matches 1 run return 0
scoreboard players set #m9 sl_global 1
function spacelegacy:museum/show_m9
tellraw @a ["",{"text":"[MUSEO] ","color":"gold","bold":true},{"text":"Nueva pieza en exposición: Chang'e 4 y Yutu-2.","color":"white"}]
