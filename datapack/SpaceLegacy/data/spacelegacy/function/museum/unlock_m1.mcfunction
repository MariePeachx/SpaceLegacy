execute if score #m1 sl_global matches 1 run return 0
scoreboard players set #m1 sl_global 1
function spacelegacy:museum/show_m1
tellraw @a ["",{"text":"[MUSEO] ","color":"gold","bold":true},{"text":"Nueva pieza en exposición: Etapa de descenso del Eagle.","color":"white"}]
