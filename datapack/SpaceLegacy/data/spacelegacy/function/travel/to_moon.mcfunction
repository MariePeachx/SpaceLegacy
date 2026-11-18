scoreboard players set @s luna 0
execute if dimension spacelegacy:moon run return run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Ya estás en la Luna. Mira hacia abajo: eso gris es la Luna.","color":"white"}]
execute unless score #built sl_global matches 1 run return run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Dame unos segundos, estoy colocando los cráteres.","color":"white"}]
execute unless dimension minecraft:overworld run return run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Desde aquí no puedo lanzarte. Vuelve al mundo normal.","color":"white"}]
execute store result score @s sl_x run data get entity @s Pos[0]
execute store result score @s sl_y run data get entity @s Pos[1]
execute store result score @s sl_z run data get entity @s Pos[2]
tag @s add sl_has_home
execute at @s run playsound minecraft:entity.firework_rocket.launch master @s ~ ~ ~ 1 0.5
execute if score #adastra sl_global matches 1 run function #spacelegacy:adastra_suit
execute in spacelegacy:moon run tp @s 0.5 224 0.5 -90 0
