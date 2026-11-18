advancement revoke @s only spacelegacy:click/rc_foto
tag @s add sl_m5_c4
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Somos los Duke. Papá nos dejó aquí en 1972. Seguramente el sol ya nos ha borrado la cara.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — La foto de familia\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Charlie Duke, Apolo 16. Por detrás escribió que era la familia del astronauta Duke, del planeta Tierra.","color":"gray"}]
function spacelegacy:m5/check
