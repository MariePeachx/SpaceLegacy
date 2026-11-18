advancement revoke @s only spacelegacy:click/central
tag @s add sl_m3_c2
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Yo lo enviaba todo a casa por radio. Hasta el 30 de septiembre de 1977. Ese día me apagaron. Sigo esperando a que alguien pulse el botón.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Estación central\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Hubo cinco estaciones ALSEP: Apolo 12, 14, 15, 16 y 17. Yo soy de esa época, por cierto.","color":"gray"}]
function spacelegacy:m3/check
