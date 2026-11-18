advancement revoke @s only spacelegacy:click/sv_pala
tag @s add sl_m4_c2
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Yo cavé zanjas para ver si el suelo aguantaba una nave. Aguantaba. De nada, Apolo.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Pala excavadora\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Antes de las Surveyor había científicos que temían que una nave se hundiera en el polvo lunar.","color":"gray"}]
function spacelegacy:m4/check
