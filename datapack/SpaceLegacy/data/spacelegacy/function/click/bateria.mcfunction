advancement revoke @s only spacelegacy:click/bateria
tag @s add sl_m2_c2
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Mis baterías no se recargan. Me hicieron para tres días de gloria. Los aproveché: 36 kilómetros.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Baterías\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Hubo tres rovers: Apolo 15, 16 y 17. Los tres siguen donde los aparcaron.","color":"gray"}]
function spacelegacy:m2/check
