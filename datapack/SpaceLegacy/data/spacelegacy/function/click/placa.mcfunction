advancement revoke @s only spacelegacy:click/placa
tag @s add sl_m1_c2
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Llevo una placa atornillada a la pata. Dice: «Vinimos en paz en nombre de toda la humanidad». La firmó hasta el presidente.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Placa de la escalera\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Sigue ahí, en la escalera por la que bajó Armstrong. Nadie la ha vuelto a leer en persona.","color":"gray"}]
function spacelegacy:m1/check
