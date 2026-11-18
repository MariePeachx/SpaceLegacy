scoreboard players set @s base 0
execute unless dimension spacelegacy:moon run return run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"La Base Legado está en la Luna. Primero hay que llegar.","color":"white"}]
tp @s 0.5 224 0.5 -90 0
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 0.6 1.4
