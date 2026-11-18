advancement grant @s only spacelegacy:legado/legado
title @s times 20 120 40
title @s subtitle {"text":"Not everything returns from space","color":"gray","italic":true}
title @s title {"text":"SEGUIMOS AQUÍ","color":"gold","bold":true}
summon firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16766720],fade_colors:[I;16777215],has_trail:true,has_twinkle:true}]}}}}
summon firework_rocket ~ ~2 ~ {LifeTime:19,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",colors:[I;5636095],fade_colors:[I;16777215],has_trail:true,has_twinkle:true}]}}}}
summon firework_rocket ~ ~2 ~ {LifeTime:17,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16733525],fade_colors:[I;16777215],has_trail:true,has_twinkle:true}]}}}}
summon firework_rocket ~ ~2 ~ {LifeTime:16,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",colors:[I;11206570],fade_colors:[I;16777215],has_trail:true,has_twinkle:true}]}}}}
summon firework_rocket ~ ~2 ~ {LifeTime:13,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16777045],fade_colors:[I;16777215],has_trail:true,has_twinkle:true}]}}}}
summon firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",colors:[I;16755200],fade_colors:[I;16777215],has_trail:true,has_twinkle:true}]}}}}
tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"12 ecos. Los tengo todos. ¿Sabes qué decían, puestos uno detrás de otro?","color":"white"}]
tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"«Seguimos aquí».","color":"gold","bold":true}]
tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"No todo vuelve del espacio. Pero ahora alguien se acuerda. He puesto tu nombre en el Muro del Legado, en la entrada del museo. Ya eres parte de esto.","color":"white"}]
tellraw @a ["",{"text":"\n[SPACE LEGACY] ","color":"gold","bold":true},{"selector":"@s"},{"text":" ha recuperado los 12 ecos de la Luna.","color":"white"}]
# Placa con su nombre en el Muro del Legado
scoreboard players add #fin sl_global 0
scoreboard players operation #col sl_global = #fin sl_global
scoreboard players operation #col sl_global %= #9 sl_global
scoreboard players operation #row sl_global = #fin sl_global
scoreboard players operation #row sl_global /= #9 sl_global
scoreboard players operation #row sl_global %= #2 sl_global
execute store result storage spacelegacy:tmp wall.x int 1 run scoreboard players remove #col sl_global 11
scoreboard players set #y sl_global 226
scoreboard players operation #y sl_global -= #row sl_global
execute store result storage spacelegacy:tmp wall.y int 1 run scoreboard players get #y sl_global
scoreboard players add #fin sl_global 1
tag @s add sl_finisher
function spacelegacy:finale_sign with storage spacelegacy:tmp wall
tag @s remove sl_finisher
