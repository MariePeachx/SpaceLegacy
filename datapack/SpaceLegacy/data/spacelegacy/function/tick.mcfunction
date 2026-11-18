scoreboard players enable @a luna
scoreboard players enable @a tierra
scoreboard players enable @a base
scoreboard players enable @a expedientes
scoreboard players enable @a sl_resp
execute as @a[tag=!sl_joined] at @s run function spacelegacy:welcome
execute as @a[scores={luna=1..}] at @s run function spacelegacy:travel/to_moon
execute as @a[scores={tierra=1..}] at @s run function spacelegacy:travel/to_earth
execute as @a[scores={base=1..}] at @s run function spacelegacy:travel/to_base
execute as @a[scores={expedientes=1..}] at @s run function spacelegacy:books/regive
execute as @a[scores={sl_resp=1..}] at @s run function spacelegacy:quiz/answer
