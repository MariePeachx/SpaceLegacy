advancement revoke @s only spacelegacy:click/motor
tag @s add sl_m1_c1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Frené desde 6.000 kilómetros por hora hasta cero. Me sobraron unos 25 segundos de combustible. Veinticinco. En Houston nadie respiraba.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Motor de descenso\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"20 de julio de 1969: primer alunizaje con personas. Bajaron Neil Armstrong y Buzz Aldrin; Michael Collins esperó en órbita.","color":"gray"}]
function spacelegacy:m1/check
