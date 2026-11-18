advancement revoke @s only spacelegacy:click/ce_lander
tag @s add sl_m9_c1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Fui la primera en posarme en la cara oculta. Allí no hay cobertura: hablo con casa rebotando la señal en un satélite.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Módulo Chang'e 4\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"China, 3 de enero de 2019. El satélite repetidor se llama Queqiao, «puente de urracas».","color":"gray"}]
function spacelegacy:m9/check
