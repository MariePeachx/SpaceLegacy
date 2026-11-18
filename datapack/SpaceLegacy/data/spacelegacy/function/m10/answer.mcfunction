execute if score @s sl_resp matches 101 run return run function spacelegacy:m10/complete
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7
execute if score @s sl_resp matches 102 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"De pie, lo que se dice de pie... no.","color":"white"}]
execute if score @s sl_resp matches 103 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Habrían salido rodando.","color":"white"}]
function spacelegacy:m10/quiz
