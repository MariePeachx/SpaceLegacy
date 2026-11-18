execute if score @s sl_resp matches 61 run return run function spacelegacy:m6/complete
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7
execute if score @s sl_resp matches 62 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Un paracaídas necesita aire. Suerte con eso.","color":"white"}]
execute if score @s sl_resp matches 63 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Para eso faltaban diez años.","color":"white"}]
function spacelegacy:m6/quiz
