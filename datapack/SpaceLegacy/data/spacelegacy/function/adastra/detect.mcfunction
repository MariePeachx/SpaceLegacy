# Esta función solo se carga si existe Ad Astra (usa uno de sus objetos)
execute if entity @e[type=ad_astra:lander,limit=1,distance=..0.01]
scoreboard players set #adastra sl_global 1
