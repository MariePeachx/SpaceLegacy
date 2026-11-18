advancement revoke @s only spacelegacy:click/be_disco
tag @s add sl_m11_c2
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Soy un disco del tamaño de un DVD. Llevo grabada una biblioteca de 30 millones de páginas. Por si acaso.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — La Biblioteca Lunar\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Una copia de seguridad del conocimiento humano, grabada en níquel. Puede que sobreviviera al golpe.","color":"gray"}]
function spacelegacy:m11/check
