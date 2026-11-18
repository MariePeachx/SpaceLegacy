advancement revoke @s only spacelegacy:click/rtg
tag @s add sl_m3_c1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Soy una pila nuclear. Doy 70 vatios, como una bombilla. Con eso mantuve viva la estación entera.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Generador SNAP-27\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Calor de plutonio-238 convertido en electricidad. Funciona también en la noche lunar, que dura 14 días.","color":"gray"}]
function spacelegacy:m3/check
