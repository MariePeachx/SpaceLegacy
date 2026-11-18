advancement revoke @s only spacelegacy:click/ch_pragyan
tag @s add sl_m8_c2
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Peso 26 kilos. Recorrí 100 metros. Encontré azufre. Luego se hizo de noche... y sigo dormido. Zzz.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Rover Pragyan\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Sin calefactor nuclear, sus circuitos no sobrevivieron a dos semanas de noche lunar.","color":"gray"}]
function spacelegacy:m8/check
