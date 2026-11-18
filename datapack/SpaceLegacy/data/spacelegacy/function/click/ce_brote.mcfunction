advancement revoke @s only spacelegacy:click/ce_brote
tag @s add sl_m9_c2
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Fui una semilla de algodón. Broté. En la Luna. Duré unos días, hasta que llegó la noche. Valió la pena.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — El brote de algodón\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Es la primera planta que ha germinado en otro mundo. Viajaba en una pequeña maceta cerrada.","color":"gray"}]
function spacelegacy:m9/check
