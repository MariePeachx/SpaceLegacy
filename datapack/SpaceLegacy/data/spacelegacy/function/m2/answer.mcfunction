execute if score @s sl_resp matches 23 run return run function spacelegacy:m2/complete
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7
execute if score @s sl_resp matches 21 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Para quemar gasolina hace falta aire. Mira a tu alrededor.","color":"white"}]
execute if score @s sl_resp matches 22 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Buena idea, pero no llevaba ni uno.","color":"white"}]
function spacelegacy:m2/quiz
