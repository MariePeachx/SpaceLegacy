# Viste el traje espacial con oxígeno en los huecos libres; si no, lo da en la mano
execute if entity @s[tag=sl_suit] run return 0
tag @s add sl_suit
execute if items entity @s armor.head * run give @s ad_astra:space_helmet
execute unless items entity @s armor.head * run item replace entity @s armor.head with ad_astra:space_helmet
execute if items entity @s armor.chest * run give @s ad_astra:space_suit[ad_astra:fluids=[{id:"ad_astra:oxygen",amount:81000L}]]
execute unless items entity @s armor.chest * run item replace entity @s armor.chest with ad_astra:space_suit[ad_astra:fluids=[{id:"ad_astra:oxygen",amount:81000L}]]
execute if items entity @s armor.legs * run give @s ad_astra:space_pants
execute unless items entity @s armor.legs * run item replace entity @s armor.legs with ad_astra:space_pants
execute if items entity @s armor.feet * run give @s ad_astra:space_boots
execute unless items entity @s armor.feet * run item replace entity @s armor.feet with ad_astra:space_boots
