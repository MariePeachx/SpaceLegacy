advancement revoke @s only spacelegacy:click/sv_camara
tag @s add sl_m4_c1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"En 1969 vinieron dos humanos, me arrancaron la cámara y se la llevaron. Ni las gracias.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Cámara de televisión\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Pete Conrad y Alan Bean, del Apolo 12. La cámara está hoy en un museo de Washington.","color":"gray"}]
function spacelegacy:m4/check
