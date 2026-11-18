execute if score #m7 sl_global matches 1 run return 0
scoreboard players set #m7 sl_global 1
function spacelegacy:museum/show_m7
tellraw @a ["",{"text":"[MUSEO] ","color":"gold","bold":true},{"text":"Nueva pieza en exposición: Rover Lunokhod 1.","color":"white"}]
