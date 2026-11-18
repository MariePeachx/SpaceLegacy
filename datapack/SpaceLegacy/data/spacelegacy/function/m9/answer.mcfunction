execute if score @s sl_resp matches 92 run return run function spacelegacy:m9/complete
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7
execute if score @s sl_resp matches 91 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"No más lejos que el resto de la Luna.","color":"white"}]
execute if score @s sl_resp matches 93 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Su antena está perfecta, gracias.","color":"white"}]
function spacelegacy:m9/quiz
