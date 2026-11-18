advancement revoke @s only spacelegacy:click/ch_vikram
tag @s add sl_m8_c1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Aterricé cerca del polo sur. Nadie lo había hecho antes. Y luego di un saltito de 40 centímetros, por presumir.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Módulo Vikram\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"India, 23 de agosto de 2023. Cuarto país en posarse con suavidad en la Luna.","color":"gray"}]
function spacelegacy:m8/check
