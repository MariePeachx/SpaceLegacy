advancement revoke @s only spacelegacy:click/lp_urna
tag @s add sl_m12_c3
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Me llamo Gene Shoemaker. Enseñé geología a los astronautas del Apolo. Siempre quise venir. Al final vine.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — La cápsula\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Sus cenizas viajaban en la sonda. Es la única persona que descansa en otro mundo.","color":"gray"}]
function spacelegacy:m12/check
