advancement revoke @s only spacelegacy:click/be_restos
tag @s add sl_m11_c1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Me falló el motor a punto de llegar. Unos minutos antes me hice una selfi con la Luna de fondo. Salgo bien.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Los restos\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Beresheet, Israel, 11 de abril de 2019. Fue el primer intento de alunizar de una organización privada.","color":"gray"}]
function spacelegacy:m11/check
