advancement revoke @s only spacelegacy:click/s_mochilas
execute if entity @s[tag=sl_s_s_mochilas] run return run tellraw @s ["",{"text":"[EL VERTEDERO] ","color":"light_purple","bold":true},{"text":"Antes de despegar tiraron por la puerta las mochilas, las botas de fuera y todo lo que sobraba. Cada kilo de menos era combustible de más. La Luna tiene un vertedero. Pequeño, pero histórico.","color":"white"}]
tag @s add sl_s_s_mochilas
scoreboard players add @s sl_sec 1
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.6
particle minecraft:wax_on ~ ~1 ~ 0.5 0.5 0.5 0 30
tellraw @s ["",{"text":"\nSECRETO ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sl_sec"},"color":"white","bold":true},{"text":"/10 · EL VERTEDERO\n","color":"light_purple","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Antes de despegar tiraron por la puerta las mochilas, las botas de fuera y todo lo que sobraba. Cada kilo de menos era combustible de más. La Luna tiene un vertedero. Pequeño, pero histórico.","color":"white"}]
execute if score @s sl_sec matches 10.. run advancement grant @s only spacelegacy:legado/secretos
