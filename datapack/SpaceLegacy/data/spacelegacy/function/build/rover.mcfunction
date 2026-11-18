# Vehículo Lunar (LRV), a tamaño real. Centro: -9.5, 45.5. Mira al este.
fill -14 224 42 -5 228 49 air
summon item_display -9.5 225.43 45.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":2}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.156f,1.156f,1.156f]}}
fill -20 224 44 -13 224 44 gray_carpet
fill -20 224 46 -13 224 46 gray_carpet
summon interaction -10.6 224 44.4 {width:1.1f,height:1.1f,response:1b,Tags:["sl","sl_i_rueda"]}
summon text_display -10.6 225.5 43.7 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Ruedas de malla\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction -8.3 224.4 44.9 {width:0.9f,height:0.9f,response:1b,Tags:["sl","sl_i_bateria"]}
summon text_display -7.8 225.9 44.2 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Baterías\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction -8.2 224.5 46.2 {width:0.8f,height:0.9f,response:1b,Tags:["sl","sl_i_camara"]}
summon text_display -7.8 225.9 47 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Cámara de televisión\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon text_display -6.5 224.02 47.5 {Tags:["sl"],alignment:"center",Rotation:[0f,-90f],background:0,text:'{"text":"T D C","color":"dark_gray","bold":true}'}
summon interaction -6.5 224 47.5 {width:1.4f,height:0.6f,response:1b,Tags:["sl","sl_i_s_tdc"]}
summon item_display -9.1 225 45.5 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:book",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.4f,0.4f,0.4f]}}
summon interaction -9.1 224.9 45.5 {width:0.6f,height:0.5f,response:1b,Tags:["sl","sl_i_s_biblia"]}
