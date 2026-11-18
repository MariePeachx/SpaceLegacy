kill @e[type=text_display,tag=sl_lock_m10]
kill @e[tag=sl_show_m10]
execute in spacelegacy:moon run summon item_display -2.5 225.702 -39.5 {Tags:["sl","sl_show_m10"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":12}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.567f,0.567f,0.567f]}}
execute in spacelegacy:moon run summon text_display -2.5 227.4 -39.5 {billboard:"center",alignment:"center",Tags:["sl","sl_show_m10"],text:'[{"text":"SLIM y la pelota SORA-Q\\n","color":"gold","bold":true},{"text":"Japón · 2024\\nAterrizó de cabeza a 55 m de la diana","color":"white","bold":false}]'}
