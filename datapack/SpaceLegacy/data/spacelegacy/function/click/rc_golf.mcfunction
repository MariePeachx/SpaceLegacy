advancement revoke @s only spacelegacy:click/rc_golf
tag @s add sl_m5_c3
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Shepard dijo que volé millas y millas. Fueron 37 metros. Sigue siendo el mejor golpe de la historia.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Las pelotas de golf\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Apolo 14, 1971. Alan Shepard coló la cabeza del palo a escondidas, dentro de un calcetín.","color":"gray"}]
function spacelegacy:m5/check
