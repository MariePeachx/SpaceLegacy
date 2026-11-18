tag @s add sl_m3_done
scoreboard players add @s sl_ecos 1
advancement grant @s only spacelegacy:legado/alsep
title @s times 10 70 20
title @s subtitle ["",{"text":"Llevas ","color":"gray"},{"score":{"name":"@s","objective":"sl_ecos"},"color":"white"},{"text":" de 12","color":"gray"}]
title @s title {"text":"ECO RECUPERADO","color":"gold","bold":true}
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
summon firework_rocket ~ ~2 ~ {LifeTime:16,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;11206570],fade_colors:[I;16777215],has_trail:true,has_twinkle:true}]}}}}
summon firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",colors:[I;16766720],fade_colors:[I;16777215],has_trail:true,has_twinkle:true}]}}}}
tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"¡Eso es! ","color":"green","bold":true},{"text":"Funcionaron solas hasta ocho años. Las apagaron para ahorrar dinero. Sí, a mí también me dolió.","color":"white"}]
tellraw @s {"text":"Tienes su expediente en el inventario y una pieza nueva en el museo.","color":"gray","italic":true}
function spacelegacy:books/m3
function spacelegacy:museum/unlock_m3
execute if score #adastra sl_global matches 1 run function #spacelegacy:adastra_refill
execute if entity @s[tag=sl_m1_done,tag=sl_m2_done,tag=sl_m3_done,tag=sl_m4_done,tag=sl_m5_done,tag=sl_m6_done,tag=sl_m7_done,tag=sl_m8_done,tag=sl_m9_done,tag=sl_m10_done,tag=sl_m11_done,tag=sl_m12_done] run function spacelegacy:finale
