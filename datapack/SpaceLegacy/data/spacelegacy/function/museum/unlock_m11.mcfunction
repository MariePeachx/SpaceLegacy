execute if score #m11 sl_global matches 1 run return 0
scoreboard players set #m11 sl_global 1
function spacelegacy:museum/show_m11
tellraw @a ["",{"text":"[MUSEO] ","color":"gold","bold":true},{"text":"Nueva pieza en exposición: Beresheet.","color":"white"}]
