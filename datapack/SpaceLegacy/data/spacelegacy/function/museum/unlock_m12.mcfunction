execute if score #m12 sl_global matches 1 run return 0
scoreboard players set #m12 sl_global 1
function spacelegacy:museum/show_m12
tellraw @a ["",{"text":"[MUSEO] ","color":"gold","bold":true},{"text":"Nueva pieza en exposición: Lunar Prospector.","color":"white"}]
