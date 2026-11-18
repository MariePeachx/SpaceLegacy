# SLIM, de cabeza, su tobera perdida y la pelota SORA-Q
fill -45 224 80 -33 228 91 air
summon item_display -40.5 225.238 85.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":12}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}
summon item_display -36.5 224.206 88.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":13}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.167f,0.167f,0.167f]}}
setblock -36 224 82 cauldron
summon interaction -40.5 224 84.6 {width:1.4f,height:2.2f,response:1b,Tags:["sl","sl_i_sl_cuerpo"]}
summon text_display -40.5 227.3 85.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"SLIM, boca abajo\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction -35.5 224 82.5 {width:1.3f,height:1.2f,response:1b,Tags:["sl","sl_i_sl_tobera"]}
summon text_display -35.5 225.7 82.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"La tobera perdida\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction -36.5 224 88.5 {width:0.9f,height:0.8f,response:1b,Tags:["sl","sl_i_sl_soraq"]}
summon text_display -36.5 225.3 88.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"La pelota SORA-Q\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
