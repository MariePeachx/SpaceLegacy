execute if score @s sl_resp matches 11..13 if entity @s[tag=sl_m1_quiz,tag=!sl_m1_done] run function spacelegacy:m1/answer
execute if score @s sl_resp matches 21..23 if entity @s[tag=sl_m2_quiz,tag=!sl_m2_done] run function spacelegacy:m2/answer
execute if score @s sl_resp matches 31..33 if entity @s[tag=sl_m3_quiz,tag=!sl_m3_done] run function spacelegacy:m3/answer
execute if score @s sl_resp matches 41..43 if entity @s[tag=sl_m4_quiz,tag=!sl_m4_done] run function spacelegacy:m4/answer
execute if score @s sl_resp matches 51..53 if entity @s[tag=sl_m5_quiz,tag=!sl_m5_done] run function spacelegacy:m5/answer
execute if score @s sl_resp matches 61..63 if entity @s[tag=sl_m6_quiz,tag=!sl_m6_done] run function spacelegacy:m6/answer
execute if score @s sl_resp matches 71..73 if entity @s[tag=sl_m7_quiz,tag=!sl_m7_done] run function spacelegacy:m7/answer
execute if score @s sl_resp matches 81..83 if entity @s[tag=sl_m8_quiz,tag=!sl_m8_done] run function spacelegacy:m8/answer
execute if score @s sl_resp matches 91..93 if entity @s[tag=sl_m9_quiz,tag=!sl_m9_done] run function spacelegacy:m9/answer
execute if score @s sl_resp matches 101..103 if entity @s[tag=sl_m10_quiz,tag=!sl_m10_done] run function spacelegacy:m10/answer
execute if score @s sl_resp matches 111..113 if entity @s[tag=sl_m11_quiz,tag=!sl_m11_done] run function spacelegacy:m11/answer
execute if score @s sl_resp matches 121..123 if entity @s[tag=sl_m12_quiz,tag=!sl_m12_done] run function spacelegacy:m12/answer
scoreboard players set @s sl_resp 0
