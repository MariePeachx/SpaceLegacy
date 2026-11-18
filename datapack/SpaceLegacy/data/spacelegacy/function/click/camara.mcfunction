advancement revoke @s only spacelegacy:click/camara
tag @s add sl_m2_c3
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Me dejaron la cámara encendida. Grabé cómo despegaban sin mí. Bonito plano, eso sí.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Cámara de televisión\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Es real: la cámara del rover del Apolo 17 retransmitió el despegue, manejada por radio desde la Tierra.","color":"gray"}]
function spacelegacy:m2/check
