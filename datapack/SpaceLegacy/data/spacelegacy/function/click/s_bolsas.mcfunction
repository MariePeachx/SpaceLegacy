advancement revoke @s only spacelegacy:click/s_bolsas
execute if entity @s[tag=sl_s_s_bolsas] run return run tellraw @s ["",{"text":"[LAS 96 BOLSAS] ","color":"light_purple","bold":true},{"text":"Ejem. Sí, es lo que piensas. Entre todas las misiones Apolo dejaron 96 bolsas de... residuos personales. Pesaban, y cada kilo cuenta para despegar. Hay científicos que quieren volver a por ellas, para ver si algo sigue vivo dentro.","color":"white"}]
tag @s add sl_s_s_bolsas
scoreboard players add @s sl_sec 1
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.6
particle minecraft:wax_on ~ ~1 ~ 0.5 0.5 0.5 0 30
tellraw @s ["",{"text":"\nSECRETO ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sl_sec"},"color":"white","bold":true},{"text":"/10 · LAS 96 BOLSAS\n","color":"light_purple","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Ejem. Sí, es lo que piensas. Entre todas las misiones Apolo dejaron 96 bolsas de... residuos personales. Pesaban, y cada kilo cuenta para despegar. Hay científicos que quieren volver a por ellas, para ver si algo sigue vivo dentro.","color":"white"}]
execute if score @s sl_sec matches 10.. run advancement grant @s only spacelegacy:legado/secretos
