advancement revoke @s only spacelegacy:click/s_olivo
execute if entity @s[tag=sl_s_s_olivo] run return run tellraw @s ["",{"text":"[LA RAMA DE OLIVO] ","color":"light_purple","bold":true},{"text":"Una ramita de olivo de oro, símbolo de paz. Armstrong y Aldrin la dejaron aquí antes de irse. Es más pequeña que tu dedo.","color":"white"}]
tag @s add sl_s_s_olivo
scoreboard players add @s sl_sec 1
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.6
particle minecraft:wax_on ~ ~1 ~ 0.5 0.5 0.5 0 30
tellraw @s ["",{"text":"\nSECRETO ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sl_sec"},"color":"white","bold":true},{"text":"/10 · LA RAMA DE OLIVO\n","color":"light_purple","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Una ramita de olivo de oro, símbolo de paz. Armstrong y Aldrin la dejaron aquí antes de irse. Es más pequeña que tu dedo.","color":"white"}]
execute if score @s sl_sec matches 10.. run advancement grant @s only spacelegacy:legado/secretos
