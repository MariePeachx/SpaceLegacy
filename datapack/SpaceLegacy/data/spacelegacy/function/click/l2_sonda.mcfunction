advancement revoke @s only spacelegacy:click/l2_sonda
tag @s add sl_m6_c1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Llegué a 12.000 kilómetros por hora. No frené. No sabía. Pero llegué la primera, en 1959.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — La sonda\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Unión Soviética, 13 de septiembre de 1959. De la sonda real no queda casi nada: esto es cómo era justo antes.","color":"gray"}]
function spacelegacy:m6/check
