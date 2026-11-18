kill @e[type=text_display,tag=sl_lock_m4]
kill @e[tag=sl_show_m4]
execute in spacelegacy:moon run summon item_display 9.5 225.701 -51.5 {Tags:["sl","sl_show_m4"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":5}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.566f,0.566f,0.566f]}}
execute in spacelegacy:moon run summon text_display 9.5 227.4 -51.5 {billboard:"center",alignment:"center",Tags:["sl","sl_show_m4"],text:'[{"text":"Sonda Surveyor 3\\n","color":"gold","bold":true},{"text":"EE. UU. · 1967\\nVisitada por el Apolo 12","color":"white","bold":false}]'}
