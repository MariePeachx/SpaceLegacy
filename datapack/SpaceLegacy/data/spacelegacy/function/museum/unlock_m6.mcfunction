execute if score #m6 sl_global matches 1 run return 0
scoreboard players set #m6 sl_global 1
function spacelegacy:museum/show_m6
tellraw @a ["",{"text":"[MUSEO] ","color":"gold","bold":true},{"text":"Nueva pieza en exposición: Sonda Luna 2.","color":"white"}]
