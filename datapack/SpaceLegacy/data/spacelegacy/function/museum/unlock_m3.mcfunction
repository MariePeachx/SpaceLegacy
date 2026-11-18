execute if score #m3 sl_global matches 1 run return 0
scoreboard players set #m3 sl_global 1
function spacelegacy:museum/show_m3
tellraw @a ["",{"text":"[MUSEO] ","color":"gold","bold":true},{"text":"Nueva pieza en exposición: Estación científica ALSEP.","color":"white"}]
