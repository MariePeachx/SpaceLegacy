execute if score @s sl_resp matches 12 run return run function spacelegacy:m1/complete
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7
execute if score @s sl_resp matches 11 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Entonces Armstrong seguiría aquí. Y no está. Piensa.","color":"white"}]
execute if score @s sl_resp matches 13 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"¿Y esto que tienes delante qué es, un holograma?","color":"white"}]
function spacelegacy:m1/quiz
