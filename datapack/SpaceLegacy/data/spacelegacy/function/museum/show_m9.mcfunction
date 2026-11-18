kill @e[type=text_display,tag=sl_lock_m9]
kill @e[tag=sl_show_m9]
execute in spacelegacy:moon run summon item_display -8.5 225.701 -39.5 {Tags:["sl","sl_show_m9"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":10}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.567f,0.567f,0.567f]}}
execute in spacelegacy:moon run summon text_display -8.5 227.4 -39.5 {billboard:"center",alignment:"center",Tags:["sl","sl_show_m9"],text:'[{"text":"Chang\'e 4 y Yutu-2\\n","color":"gold","bold":true},{"text":"China · 2019\\nPrimer alunizaje en la cara oculta","color":"white","bold":false}]'}
