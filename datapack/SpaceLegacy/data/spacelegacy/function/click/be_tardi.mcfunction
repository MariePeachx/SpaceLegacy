advancement revoke @s only spacelegacy:click/be_tardi
tag @s add sl_m11_c3
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2
particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25
tellraw @s ["",{"text":"\n« ","color":"gold"},{"text":"Somos tardígrados. Miles. Medimos medio milímetro y aguantamos casi todo. ¿Un choque contra la Luna? ...Eso ya no lo sabemos.","color":"yellow","italic":true},{"text":" »\n","color":"gold"},{"text":"   — Los tardígrados\n","color":"gold","bold":true},{"text":"ECO › ","color":"aqua","bold":true},{"text":"Viajaban secos y dormidos. Lo más probable es que no sobrevivieran. Pero nadie ha ido a mirar.","color":"gray"}]
function spacelegacy:m11/check
