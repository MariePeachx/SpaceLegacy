advancement revoke @s only spacelegacy:click/lk_retro
tag @s add sl_m7_c3
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Estuve perdida 40 años. Nadie sabía dónde había aparcado. En 2010 me encontraron, y mi espejo todavía funcionaba.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Retrorreflector francés\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"La localizó desde la órbita la sonda LRO de la NASA. Ese mismo año le acertaron con un láser.","color":"gray"}]
function spacelegacy:m7/check
