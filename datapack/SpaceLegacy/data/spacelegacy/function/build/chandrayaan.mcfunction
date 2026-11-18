# Chandrayaan-3: módulo Vikram y rover Pragyan
fill 85 224 65 98 229 77 air
summon item_display 90.5 225.32 70.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":8}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.067f,1.067f,1.067f]}}
summon item_display 94.5 224.536 70.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":9}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.433f,0.433f,0.433f]}}
setblock 89 224 73 end_rod
summon interaction 90.5 224.4 69.5 {width:1.4f,height:1.6f,response:1b,Tags:["sl","sl_i_ch_vikram"]}
summon text_display 90.5 226.7 69.3 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Módulo Vikram\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction 94.5 224 70.5 {width:1.3f,height:1.1f,response:1b,Tags:["sl","sl_i_ch_pragyan"]}
summon text_display 94.5 225.6 70.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Rover Pragyan\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction 89.5 224 73.5 {width:1f,height:1.2f,response:1b,Tags:["sl","sl_i_ch_termo"]}
summon text_display 89.5 225.7 73.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Sonda térmica\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
