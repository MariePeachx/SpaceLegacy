advancement revoke @s only spacelegacy:click/ce_yutu
tag @s add sl_m9_c3
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Me llamo Yutu-2, «conejo de jade». Me fabricaron para tres meses. Llevo años. No pienso parar.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Rover Yutu-2\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Es el rover lunar que más tiempo ha funcionado. Lleva un radar que ve bajo el suelo.","color":"gray"}]
function spacelegacy:m9/check
