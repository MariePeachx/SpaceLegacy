scoreboard players set @s tierra 0
execute unless dimension spacelegacy:moon run return run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Ya estás en la Tierra. Se nota por el aire.","color":"white"}]
title @s times 10 40 20
title @s title {"text":"LA TIERRA","color":"aqua","bold":true}
execute unless entity @s[tag=sl_has_home] run return run execute in minecraft:overworld run spreadplayers 0 0 0 16 false @s
execute store result storage spacelegacy:tmp home.x int 1 run scoreboard players get @s sl_x
execute store result storage spacelegacy:tmp home.y int 1 run scoreboard players get @s sl_y
execute store result storage spacelegacy:tmp home.z int 1 run scoreboard players get @s sl_z
function spacelegacy:travel/land with storage spacelegacy:tmp home
