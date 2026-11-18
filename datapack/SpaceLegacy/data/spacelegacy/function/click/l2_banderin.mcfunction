advancement revoke @s only spacelegacy:click/l2_banderin
tag @s add sl_m6_c2
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Somos banderines de metal. Nos hicieron para salir volando en el choque. Misión cumplida.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Los banderines\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"El líder soviético le regaló una copia de esta esfera al presidente de Estados Unidos. Con toda la intención.","color":"gray"}]
function spacelegacy:m6/check
