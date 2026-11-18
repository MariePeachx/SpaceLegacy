execute if score @s sl_resp matches 53 run return run function spacelegacy:m5/complete
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7
execute if score @s sl_resp matches 51 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Eso pasa en la Tierra, por el aire. Aquí no hay.","color":"white"}]
execute if score @s sl_resp matches 52 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Hay poca gravedad, pero hay. Tú misma estás en el suelo.","color":"white"}]
function spacelegacy:m5/quiz
