advancement revoke @s only spacelegacy:click/s_telescopio
execute if entity @s[tag=sl_s_s_telescopio] run return run tellraw @s ["",{"text":"[EL PRIMER OBSERVATORIO] ","color":"light_purple","bold":true},{"text":"Un telescopio chapado en oro que el Apolo 16 usó para fotografiar la Tierra y las estrellas en luz ultravioleta. El primer observatorio astronómico en otro mundo. Sigue apuntando al cielo.","color":"white"}]
tag @s add sl_s_s_telescopio
scoreboard players add @s sl_sec 1
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.6
particle minecraft:wax_on ~ ~1 ~ 0.5 0.5 0.5 0 30
tellraw @s ["",{"text":"\nSECRETO ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sl_sec"},"color":"white","bold":true},{"text":"/10 · EL PRIMER OBSERVATORIO\n","color":"light_purple","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Un telescopio chapado en oro que el Apolo 16 usó para fotografiar la Tierra y las estrellas en luz ultravioleta. El primer observatorio astronómico en otro mundo. Sigue apuntando al cielo.","color":"white"}]
execute if score @s sl_sec matches 10.. run advancement grant @s only spacelegacy:legado/secretos
