advancement revoke @s only spacelegacy:click/rc_pluma
tag @s add sl_m5_c2
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"¡Empate! El martillo y yo tocamos el suelo a la vez. Galileo tenía razón y yo fui la prueba.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — El martillo y la pluma\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"David Scott los soltó en directo por televisión. Sin aire que frene, todo cae igual de rápido.","color":"gray"}]
function spacelegacy:m5/check
