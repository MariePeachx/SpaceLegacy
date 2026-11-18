advancement revoke @s only spacelegacy:click/ch_termo
tag @s add sl_m8_c3
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Soy un termómetro clavado en el suelo. A 8 centímetros hace muchísimo más frío que arriba. El polvo lunar abriga.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Sonda térmica\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Por eso una base enterrada en la Luna estaría protegida del calor y del frío.","color":"gray"}]
function spacelegacy:m8/check
