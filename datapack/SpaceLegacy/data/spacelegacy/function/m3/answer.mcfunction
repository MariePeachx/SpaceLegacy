execute if score @s sl_resp matches 31 run return run function spacelegacy:m3/complete
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7
execute if score @s sl_resp matches 32 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Ojalá. Trabajaron muchísimo más.","color":"white"}]
execute if score @s sl_resp matches 33 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"No: las apagaron. Lo único que sigue funcionando son los espejos láser.","color":"white"}]
function spacelegacy:m3/quiz
