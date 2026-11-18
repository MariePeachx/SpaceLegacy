advancement revoke @s only spacelegacy:click/sl_tobera
tag @s add sl_m10_c2
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Yo soy la tobera. Me caí. Lo siento mucho por todo.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — La tobera perdida\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Con los paneles mirando hacia donde no era, SLIM se quedó sin luz. Días después el Sol cambió de sitio y despertó.","color":"gray"}]
function spacelegacy:m10/check
