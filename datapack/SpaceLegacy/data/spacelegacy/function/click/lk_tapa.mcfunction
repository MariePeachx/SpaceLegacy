advancement revoke @s only spacelegacy:click/lk_tapa
tag @s add sl_m7_c2
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"De día abro la tapa y tomo el sol. De noche la cierro y me caliento con polonio radiactivo. Cada una tiene su manta.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Tapa con panel solar\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"La noche lunar dura 14 días y llega a unos 170 grados bajo cero.","color":"gray"}]
function spacelegacy:m7/check
