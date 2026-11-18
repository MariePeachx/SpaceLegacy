execute if score @s sl_resp matches 113 run return run function spacelegacy:m11/complete
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7
execute if score @s sl_resp matches 111 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"No. Algo todavía más duro que una hormiga.","color":"white"}]
execute if score @s sl_resp matches 112 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"¡No! Por suerte.","color":"white"}]
function spacelegacy:m11/quiz
