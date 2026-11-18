execute if score @s sl_resp matches 73 run return run function spacelegacy:m7/complete
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7
execute if score @s sl_resp matches 71 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Habría sido un viaje incómodo. Y sin vuelta.","color":"white"}]
execute if score @s sl_resp matches 72 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Ojalá. La conducían a mano, curva a curva.","color":"white"}]
function spacelegacy:m7/quiz
