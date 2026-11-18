advancement revoke @s only spacelegacy:click/sl_cuerpo
tag @s add sl_m10_c1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Sí, estoy boca abajo. Perdí una tobera a 50 metros del suelo. Pero clavé el sitio: a 55 metros de la diana. Me llaman la francotiradora lunar.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — SLIM, boca abajo\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"SLIM, Japón, enero de 2024. Quinto país en alunizar. Otras naves fallan su objetivo por kilómetros.","color":"gray"}]
function spacelegacy:m10/check
