tag @s add sl_onmoon
scoreboard players add @s sl_ecos 0
scoreboard players add @s sl_sec 0
title @s times 10 70 20
title @s subtitle {"text":"Aquí nadie ha barrido desde 1972","color":"gray"}
title @s title {"text":"LA LUNA","color":"white","bold":true}
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 0.6
execute unless score #adastra sl_global matches 1 unless entity @s[tag=sl_suit] run function spacelegacy:moon/suit
execute if score #adastra sl_global matches 1 run function #spacelegacy:adastra_suit
tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Has llegado. No toques nada. ...Es broma: tócalo todo, para eso has venido.","color":"white"}]
tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Cada columna de luz es un eco sin recoger. Empieza por el Eagle, al este. Si te pierdes, tengo una terminal en la base.","color":"white"}]
execute unless entity @s[x=0,y=224,z=0,distance=..130] run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Has aterrizado un poco lejos. ","color":"white"},{"text":"[Ir a la Base Legado]","color":"green","underlined":true,"clickEvent":{"action":"run_command","value":"/trigger base"}}]
