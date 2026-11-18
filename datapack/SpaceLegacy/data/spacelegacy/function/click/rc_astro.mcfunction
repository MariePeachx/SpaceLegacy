advancement revoke @s only spacelegacy:click/rc_astro
tag @s add sl_m5_c1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Mido 8,5 centímetros. A mi lado hay 14 nombres: personas que murieron intentando llegar hasta aquí.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — El astronauta caído\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"El Astronauta Caído. Lo dejó David Scott, del Apolo 15, en 1971. Es el único monumento que hay en la Luna.","color":"gray"}]
function spacelegacy:m5/check
