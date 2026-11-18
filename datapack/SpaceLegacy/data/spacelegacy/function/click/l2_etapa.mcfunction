advancement revoke @s only spacelegacy:click/l2_etapa
tag @s add sl_m6_c3
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Yo solo era el cohete. Nadie me invitó. Me estrellé media hora después igualmente.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — La tercera etapa\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Así que aquel día llegaron a la Luna dos objetos humanos, no uno.","color":"gray"}]
function spacelegacy:m6/check
