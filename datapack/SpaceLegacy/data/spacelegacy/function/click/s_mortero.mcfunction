advancement revoke @s only spacelegacy:click/s_mortero
execute if entity @s[tag=sl_s_s_mortero] run return run tellraw @s ["",{"text":"[LAS GRANADAS] ","color":"light_purple","bold":true},{"text":"El Apolo 14 dejó un mortero con cuatro granadas para provocar pequeños temblores y estudiarlos. Nunca se atrevieron a dispararlo. Así que sí: hay explosivos sin estallar en la Luna. No lo toques. ...Ya lo has tocado.","color":"white"}]
tag @s add sl_s_s_mortero
scoreboard players add @s sl_sec 1
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.6
particle minecraft:wax_on ~ ~1 ~ 0.5 0.5 0.5 0 30
tellraw @s ["",{"text":"\nSECRETO ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sl_sec"},"color":"white","bold":true},{"text":"/10 · LAS GRANADAS\n","color":"light_purple","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"El Apolo 14 dejó un mortero con cuatro granadas para provocar pequeños temblores y estudiarlos. Nunca se atrevieron a dispararlo. Así que sí: hay explosivos sin estallar en la Luna. No lo toques. ...Ya lo has tocado.","color":"white"}]
execute if score @s sl_sec matches 10.. run advancement grant @s only spacelegacy:legado/secretos
