kill @e[type=text_display,tag=sl_lock_m12]
kill @e[tag=sl_show_m12]
execute in spacelegacy:moon run summon item_display 9.5 225.701 -39.5 {Tags:["sl","sl_show_m12"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":15}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.567f,0.567f,0.567f]}}
execute in spacelegacy:moon run summon text_display 9.5 227.4 -39.5 {billboard:"center",alignment:"center",Tags:["sl","sl_show_m12"],text:'[{"text":"Lunar Prospector\\n","color":"gold","bold":true},{"text":"NASA · 1999\\nLleva las cenizas de Gene Shoemaker","color":"white","bold":false}]'}
