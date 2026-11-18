execute unless entity @s[tag=sl_onmoon] run function spacelegacy:moon/arrive
execute unless score #adastra sl_global matches 1 run function spacelegacy:moon/gravity
title @s actionbar ["",{"text":"Ecos ","color":"gold"},{"score":{"name":"@s","objective":"sl_ecos"},"color":"white"},{"text":"/12","color":"gray"},{"text":"   Secretos ","color":"light_purple"},{"score":{"name":"@s","objective":"sl_sec"},"color":"white"},{"text":"/10","color":"gray"}]
