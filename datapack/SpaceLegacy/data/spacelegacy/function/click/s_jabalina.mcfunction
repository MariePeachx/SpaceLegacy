advancement revoke @s only spacelegacy:click/s_jabalina
execute if entity @s[tag=sl_s_s_jabalina] run return run tellraw @s ["",{"text":"[LA JABALINA] ","color":"light_purple","bold":true},{"text":"Después del golpe de golf de Shepard, su compañero Ed Mitchell lanzó un palo como si fuera una jabalina. Primeras olimpiadas lunares. Ganó Mitchell por unos centímetros.","color":"white"}]
tag @s add sl_s_s_jabalina
scoreboard players add @s sl_sec 1
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.6
particle minecraft:wax_on ~ ~1 ~ 0.5 0.5 0.5 0 30
tellraw @s ["",{"text":"\nSECRETO ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sl_sec"},"color":"white","bold":true},{"text":"/10 · LA JABALINA\n","color":"light_purple","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Después del golpe de golf de Shepard, su compañero Ed Mitchell lanzó un palo como si fuera una jabalina. Primeras olimpiadas lunares. Ganó Mitchell por unos centímetros.","color":"white"}]
execute if score @s sl_sec matches 10.. run advancement grant @s only spacelegacy:legado/secretos
