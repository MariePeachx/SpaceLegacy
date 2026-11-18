execute if score @s sl_resp matches 122 run return run function spacelegacy:m12/complete
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7
execute if score @s sl_resp matches 121 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Qué poco cariño. No.","color":"white"}]
execute if score @s sl_resp matches 123 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"No tenía. Nunca los tuvo.","color":"white"}]
function spacelegacy:m12/quiz
