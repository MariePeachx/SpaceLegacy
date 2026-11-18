execute if score #m5 sl_global matches 1 run return 0
scoreboard players set #m5 sl_global 1
function spacelegacy:museum/show_m5
tellraw @a ["",{"text":"[MUSEO] ","color":"gold","bold":true},{"text":"Nueva pieza en exposición: Objetos personales.","color":"white"}]
