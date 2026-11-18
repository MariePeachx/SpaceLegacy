advancement revoke @s only spacelegacy:click/lk_rueda
tag @s add sl_m7_c1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Me conducían cinco humanos desde la Tierra, con varios segundos de retraso. Como jugar con muchísimo lag.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Ocho ruedas\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Lunokhod 1, Unión Soviética, 1970. Recorrió 10,5 km en unos diez meses.","color":"gray"}]
function spacelegacy:m7/check
