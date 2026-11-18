advancement revoke @s only spacelegacy:click/lp_hielo
tag @s add sl_m12_c2
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Soy hielo. Llevo aquí millones de años, en cráteres donde nunca da el sol. Soy lo más valioso de la Luna.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — El hielo\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Prospector detectó hidrógeno en los polos: la pista del agua helada. Con ella se puede beber, respirar y fabricar combustible.","color":"gray"}]
function spacelegacy:m12/check
