execute if score @s sl_resp matches 42 run return run function spacelegacy:m4/complete
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7
execute if score @s sl_resp matches 41 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"No: la primera fue soviética. Ya la conocerás.","color":"white"}]
execute if score @s sl_resp matches 43 run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Sin cámara lo tiene complicado.","color":"white"}]
function spacelegacy:m4/quiz
