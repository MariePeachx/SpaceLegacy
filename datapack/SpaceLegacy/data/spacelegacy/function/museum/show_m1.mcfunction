kill @e[type=text_display,tag=sl_lock_m1]
kill @e[tag=sl_show_m1]
execute in spacelegacy:moon run summon item_display -8.5 225.701 -51.5 {Tags:["sl","sl_show_m1"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":1}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.567f,0.567f,0.567f]}}
execute in spacelegacy:moon run summon text_display -8.5 227.4 -51.5 {billboard:"center",alignment:"center",Tags:["sl","sl_show_m1"],text:'[{"text":"Etapa de descenso del Eagle\\n","color":"gold","bold":true},{"text":"Apolo 11 · 1969\\nSigue en el Mar de la Tranquilidad","color":"white","bold":false}]'}
