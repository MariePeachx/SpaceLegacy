advancement revoke @s only spacelegacy:click/s_biblia
execute if entity @s[tag=sl_s_s_biblia] run return run tellraw @s ["",{"text":"[EL LIBRO DEL SALPICADERO] ","color":"light_purple","bold":true},{"text":"David Scott dejó una Biblia roja sobre el panel de mandos de su rover, el del Apolo 15. Sigue ahí, encima del coche.","color":"white"}]
tag @s add sl_s_s_biblia
scoreboard players add @s sl_sec 1
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.6
particle minecraft:wax_on ~ ~1 ~ 0.5 0.5 0.5 0 30
tellraw @s ["",{"text":"\nSECRETO ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sl_sec"},"color":"white","bold":true},{"text":"/10 · EL LIBRO DEL SALPICADERO\n","color":"light_purple","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"David Scott dejó una Biblia roja sobre el panel de mandos de su rover, el del Apolo 15. Sigue ahí, encima del coche.","color":"white"}]
execute if score @s sl_sec matches 10.. run advancement grant @s only spacelegacy:legado/secretos
