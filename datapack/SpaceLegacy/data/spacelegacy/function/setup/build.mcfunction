execute if score #built sl_global matches 1 run return 0
kill @e[tag=sl]
execute in spacelegacy:moon run function spacelegacy:build/terrain
execute in spacelegacy:moon run function spacelegacy:build/pad
execute in spacelegacy:moon run function spacelegacy:build/banners
execute in spacelegacy:moon run function spacelegacy:build/eagle
execute in spacelegacy:moon run function spacelegacy:build/rover
execute in spacelegacy:moon run function spacelegacy:build/alsep
execute in spacelegacy:moon run function spacelegacy:build/surveyor
execute in spacelegacy:moon run function spacelegacy:build/recuerdos
execute in spacelegacy:moon run function spacelegacy:build/luna2
execute in spacelegacy:moon run function spacelegacy:build/lunokhod
execute in spacelegacy:moon run function spacelegacy:build/chandrayaan
execute in spacelegacy:moon run function spacelegacy:build/change4
execute in spacelegacy:moon run function spacelegacy:build/slim
execute in spacelegacy:moon run function spacelegacy:build/beresheet
execute in spacelegacy:moon run function spacelegacy:build/prospector
execute in spacelegacy:moon run function spacelegacy:build/museum
execute if score #adastra sl_global matches 1 run execute in spacelegacy:moon run function #spacelegacy:adastra_decorate
scoreboard players set #built sl_global 1
execute in spacelegacy:moon run forceload remove all
execute in spacelegacy:moon run forceload add -16 -64 15 -17
tellraw @a ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"La Luna está lista. ","color":"white"},{"text":"[Viajar a la Luna]","color":"green","underlined":true,"clickEvent":{"action":"run_command","value":"/trigger luna"}}]
