advancement revoke @s only spacelegacy:click/sl_soraq
tag @s add sl_m10_c3
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Soy una pelota. Me abro en dos y ruedo. Me diseñó una empresa de juguetes. Yo le hice la foto a SLIM de cabeza. De nada.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — La pelota SORA-Q\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"SORA-Q pesa 250 gramos, como una pelota de béisbol. La foto es real y es buenísima.","color":"gray"}]
function spacelegacy:m10/check
