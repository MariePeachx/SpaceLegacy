advancement revoke @s only spacelegacy:click/rueda
tag @s add sl_m2_c1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Mis ruedas son de alambre. Sin aire dentro. ¿Para qué, si fuera tampoco hay?","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Ruedas de malla\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Malla de acero con tiras de titanio para agarrarse al polvo. Cada rueda tenía su propio motor eléctrico.","color":"gray"}]
function spacelegacy:m2/check
