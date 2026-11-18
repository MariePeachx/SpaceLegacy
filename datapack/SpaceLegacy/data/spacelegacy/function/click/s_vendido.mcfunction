advancement revoke @s only spacelegacy:click/s_vendido
execute if entity @s[tag=sl_s_s_vendido] run return run tellraw @s ["",{"text":"[VENDIDO] ","color":"light_purple","bold":true},{"text":"El hermano de este rover, el Lunokhod 2, se vendió en una subasta en 1993 por 68.500 dólares. Lo compró Richard Garriott, un creador de videojuegos. Es la única persona dueña de un vehículo aparcado en otro mundo.","color":"white"}]
tag @s add sl_s_s_vendido
scoreboard players add @s sl_sec 1
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.6
particle minecraft:wax_on ~ ~1 ~ 0.5 0.5 0.5 0 30
tellraw @s ["",{"text":"\nSECRETO ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sl_sec"},"color":"white","bold":true},{"text":"/10 · VENDIDO\n","color":"light_purple","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"El hermano de este rover, el Lunokhod 2, se vendió en una subasta en 1993 por 68.500 dólares. Lo compró Richard Garriott, un creador de videojuegos. Es la única persona dueña de un vehículo aparcado en otro mundo.","color":"white"}]
execute if score @s sl_sec matches 10.. run advancement grant @s only spacelegacy:legado/secretos
