tag @s add sl_m4_found
title @s times 10 60 20
title @s subtitle {"text":"La sonda a la que robaron","color":"gray"}
title @s title {"text":"SURVEYOR 3","color":"gold","bold":true}
playsound minecraft:block.amethyst_block.chime master @s ~ ~ ~ 1 0.8
playsound minecraft:block.beacon.ambient master @s ~ ~ ~ 1 1.4
tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Eco 04. Surveyor 3. Cuidado, que tiene mal genio: le robaron. Pregúntale, ya verás.","color":"white"}]
