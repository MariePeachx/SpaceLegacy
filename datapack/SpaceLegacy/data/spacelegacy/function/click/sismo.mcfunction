advancement revoke @s only spacelegacy:click/sismo
tag @s add sl_m3_c3
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Shhh. Estoy escuchando. La Luna tiembla, ¿sabes? Eso lo descubrí yo.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Sismómetro\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Los sismómetros del Apolo registraron miles de lunamotos y golpes de meteoritos. Así sabemos cómo es la Luna por dentro.","color":"gray"}]
function spacelegacy:m3/check
