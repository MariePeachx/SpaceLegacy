advancement revoke @s only spacelegacy:click/sv_pata
tag @s add sl_m4_c3
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Mi aterrizaje: boing, boing... y ya. Reboté dos veces porque el motor no se apagó. Yo lo llamo estilo.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Patas de aterrizaje\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Alunizó el 20 de abril de 1967 y envió más de 6.000 fotos del suelo.","color":"gray"}]
function spacelegacy:m4/check
