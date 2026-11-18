execute if score @s sl_resp matches 82 run return run function spacelegacy:m8/complete
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7
execute if score @s sl_resp matches 81 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Aquí nadie usa gasolina. Nadie.","color":"white"}]
execute if score @s sl_resp matches 83 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"No tenía cómo. Casi nada vuelve.","color":"white"}]
function spacelegacy:m8/quiz
