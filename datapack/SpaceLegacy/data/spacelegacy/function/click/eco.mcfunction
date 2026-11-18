advancement revoke @s only spacelegacy:click/eco
playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 0.6 1.6
execute if score #adastra sl_global matches 1 run function #spacelegacy:adastra_refill
execute if entity @s[tag=sl_m1_done,tag=sl_m2_done,tag=sl_m3_done,tag=sl_m4_done,tag=sl_m5_done,tag=sl_m6_done,tag=sl_m7_done,tag=sl_m8_done,tag=sl_m9_done,tag=sl_m10_done,tag=sl_m11_done,tag=sl_m12_done] run return run tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Ya los tienes todos. Ve al museo, anda. Tu nombre está en la pared.","color":"white"}]
tellraw @s ["",{"text":"ECO › ","color":"aqua","bold":true},{"text":"Ecos que aún oigo sin recoger (X, Z):","color":"white"}]
execute unless entity @s[tag=sl_m1_done] run tellraw @s ["",{"text":"   01 ","color":"gray"},{"text":"THE EAGLE","color":"gold"},{"text":"  40, 0","color":"white"}]
execute unless entity @s[tag=sl_m2_done] run tellraw @s ["",{"text":"   02 ","color":"gray"},{"text":"LUNAR ROVER","color":"gold"},{"text":"  -10, 45","color":"white"}]
execute unless entity @s[tag=sl_m3_done] run tellraw @s ["",{"text":"   03 ","color":"gray"},{"text":"ALSEP","color":"gold"},{"text":"  -45, -20","color":"white"}]
execute unless entity @s[tag=sl_m4_done] run tellraw @s ["",{"text":"   04 ","color":"gray"},{"text":"SURVEYOR 3","color":"gold"},{"text":"  88, -30","color":"white"}]
execute unless entity @s[tag=sl_m5_done] run tellraw @s ["",{"text":"   05 ","color":"gray"},{"text":"RECUERDOS","color":"gold"},{"text":"  38, 84","color":"white"}]
execute unless entity @s[tag=sl_m6_done] run tellraw @s ["",{"text":"   06 ","color":"gray"},{"text":"LUNA 2","color":"gold"},{"text":"  -85, -65","color":"white"}]
execute unless entity @s[tag=sl_m7_done] run tellraw @s ["",{"text":"   07 ","color":"gray"},{"text":"LUNOKHOD 1","color":"gold"},{"text":"  -85, 20","color":"white"}]
execute unless entity @s[tag=sl_m8_done] run tellraw @s ["",{"text":"   08 ","color":"gray"},{"text":"CHANDRAYAAN-3","color":"gold"},{"text":"  91, 71","color":"white"}]
execute unless entity @s[tag=sl_m9_done] run tellraw @s ["",{"text":"   09 ","color":"gray"},{"text":"CHANG'E 4","color":"gold"},{"text":"  32, -84","color":"white"}]
execute unless entity @s[tag=sl_m10_done] run tellraw @s ["",{"text":"   10 ","color":"gray"},{"text":"SLIM","color":"gold"},{"text":"  -39, 85","color":"white"}]
execute unless entity @s[tag=sl_m11_done] run tellraw @s ["",{"text":"   11 ","color":"gray"},{"text":"BERESHEET","color":"gold"},{"text":"  -45, -88","color":"white"}]
execute unless entity @s[tag=sl_m12_done] run tellraw @s ["",{"text":"   12 ","color":"gray"},{"text":"LUNAR PROSPECTOR","color":"gold"},{"text":"  60, 95","color":"white"}]
execute if score @s sl_sec matches ..9 run tellraw @s {"text":"   ...y hay secretos que ni yo sé dónde están. Busca destellos.","color":"light_purple","italic":true}
