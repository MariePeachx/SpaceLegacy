advancement revoke @s only spacelegacy:click/lp_sonda
tag @s add sl_m12_c1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Di vueltas a la Luna durante año y medio. Cuando acabé, me estrellaron aquí a propósito, por si saltaba agua. No saltó. Pero la hay.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — La sonda\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Lunar Prospector, NASA, 31 de julio de 1999. Cayó en un cráter cerca del polo sur.","color":"gray"}]
function spacelegacy:m12/check
