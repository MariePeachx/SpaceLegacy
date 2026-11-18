advancement revoke @s only spacelegacy:click/lrrr
tag @s add sl_m1_c3
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Yo no gasto pilas. Me disparan láseres desde la Tierra y los devuelvo. Llevo así desde 1969 y no he fallado ni uno.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Retrorreflector láser\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Gracias a este espejo sabemos que la Luna se aleja 3,8 cm cada año. Tranquilidad: va para largo.","color":"gray"}]
function spacelegacy:m1/check
