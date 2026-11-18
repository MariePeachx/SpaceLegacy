kill @e[type=text_display,tag=sl_lock_m5]
kill @e[tag=sl_show_m5]
execute in spacelegacy:moon run summon item_display -8.5 225.7 -45.5 {Tags:["sl","sl_show_m5"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":16}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.566f,0.566f,0.566f]}}
execute in spacelegacy:moon run summon text_display -8.5 227.4 -45.5 {billboard:"center",alignment:"center",Tags:["sl","sl_show_m5"],text:'[{"text":"Objetos personales\\n","color":"gold","bold":true},{"text":"Apolo 14, 15 y 16 · 1971-1972\\nPequeños recuerdos humanos","color":"white","bold":false}]'}
