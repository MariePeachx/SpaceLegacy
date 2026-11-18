# Surveyor 3, a tamaño real. Centro: 88.5, -29.5
fill 82 224 -36 95 231 -24 air
summon item_display 88.5 225.818 -29.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":5}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.469f,1.469f,1.469f]}}
# La zanja que cavó su pala
fill 91 223 -31 92 223 -31 air
summon interaction 88.9 225.2 -29.1 {width:0.7f,height:0.8f,response:1b,Tags:["sl","sl_i_sv_camara"]}
summon text_display 89.3 227.3 -28.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Cámara de televisión\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction 90.1 224.3 -29.7 {width:0.7f,height:0.8f,response:1b,Tags:["sl","sl_i_sv_pala"]}
summon text_display 90.9 225.6 -30.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Pala excavadora\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction 87.1 224 -28.1 {width:0.9f,height:0.9f,response:1b,Tags:["sl","sl_i_sv_pata"]}
summon text_display 86.5 225.3 -27.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Patas de aterrizaje\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
