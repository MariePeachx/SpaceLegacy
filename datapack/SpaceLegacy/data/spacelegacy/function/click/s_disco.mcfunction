advancement revoke @s only spacelegacy:click/s_disco
execute if entity @s[tag=sl_s_s_disco] run return run tellraw @s ["",{"text":"[EL DISCO DE LOS MENSAJES] ","color":"light_purple","bold":true},{"text":"Un disco de silicio del tamaño de una moneda con mensajes de 73 países, escritos tan pequeños que hace falta un microscopio para leerlos.","color":"white"}]
tag @s add sl_s_s_disco
scoreboard players add @s sl_sec 1
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.6
particle minecraft:wax_on ~ ~1 ~ 0.5 0.5 0.5 0 30
tellraw @s ["",{"text":"\nSECRETO ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sl_sec"},"color":"white","bold":true},{"text":"/10 · EL DISCO DE LOS MENSAJES\n","color":"light_purple","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Un disco de silicio del tamaño de una moneda con mensajes de 73 países, escritos tan pequeños que hace falta un microscopio para leerlos.","color":"white"}]
execute if score @s sl_sec matches 10.. run advancement grant @s only spacelegacy:legado/secretos
