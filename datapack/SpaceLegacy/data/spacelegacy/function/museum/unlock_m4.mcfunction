execute if score #m4 sl_global matches 1 run return 0
scoreboard players set #m4 sl_global 1
function spacelegacy:museum/show_m4
tellraw @a ["",{"text":"[MUSEO] ","color":"gold","bold":true},{"text":"Nueva pieza en exposición: Sonda Surveyor 3.","color":"white"}]
