execute if score #m10 sl_global matches 1 run return 0
scoreboard players set #m10 sl_global 1
function spacelegacy:museum/show_m10
tellraw @a ["",{"text":"[MUSEO] ","color":"gold","bold":true},{"text":"Nueva pieza en exposición: SLIM y la pelota SORA-Q.","color":"white"}]
