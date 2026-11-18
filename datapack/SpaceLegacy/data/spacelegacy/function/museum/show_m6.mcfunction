kill @e[type=text_display,tag=sl_lock_m6]
kill @e[tag=sl_show_m6]
execute in spacelegacy:moon run summon item_display -2.5 225.701 -45.5 {Tags:["sl","sl_show_m6"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":6}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.567f,0.567f,0.567f]}}
execute in spacelegacy:moon run summon text_display -2.5 227.4 -45.5 {billboard:"center",alignment:"center",Tags:["sl","sl_show_m6"],text:'[{"text":"Sonda Luna 2\\n","color":"gold","bold":true},{"text":"URSS · 1959\\nEl primer objeto humano en la Luna","color":"white","bold":false}]'}
