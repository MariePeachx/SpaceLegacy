advancement revoke @s only spacelegacy:click/s_tdc
execute if entity @s[tag=sl_s_s_tdc] run return run tellraw @s ["",{"text":"[TDC] ","color":"light_purple","bold":true},{"text":"Gene Cernan, el último humano que pisó la Luna, escribió en el polvo las iniciales de su hija: TDC, Tracy Dawn Cernan. Sin viento ni lluvia, pueden durar millones de años.","color":"white"}]
tag @s add sl_s_s_tdc
scoreboard players add @s sl_sec 1
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.6
particle minecraft:wax_on ~ ~1 ~ 0.5 0.5 0.5 0 30
tellraw @s ["",{"text":"\nSECRETO ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"sl_sec"},"color":"white","bold":true},{"text":"/10 · TDC\n","color":"light_purple","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Gene Cernan, el último humano que pisó la Luna, escribió en el polvo las iniciales de su hija: TDC, Tracy Dawn Cernan. Sin viento ni lluvia, pueden durar millones de años.","color":"white"}]
execute if score @s sl_sec matches 10.. run advancement grant @s only spacelegacy:legado/secretos
