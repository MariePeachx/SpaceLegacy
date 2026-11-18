# Objetos personales de los astronautas. Centro: 38, 84
fill 30 224 77 46 227 90 air
summon item_display 38.5 224.412 80.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":16}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.333f,0.333f,0.333f]}}
summon item_display 33.2 224.05 84.5 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:mace",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f]}}
summon item_display 34 224.05 84.5 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:feather",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]}}
summon item_display 43.2 224.05 84.3 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:snowball",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.4f,0.4f,0.4f]}}
summon item_display 44 224.05 85 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:snowball",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.4f,0.4f,0.4f]}}
summon item_display 43.2 224.05 85.2 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:iron_hoe",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.9f,0.9f,0.9f]}}
summon item_display 38.5 224.05 87.5 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:paper",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]}}
summon interaction 38.5 224 80.5 {width:1.4f,height:0.9f,response:1b,Tags:["sl","sl_i_rc_astro"]}
summon text_display 38.5 225.5 80.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"El astronauta caído\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction 33.5 224 84.5 {width:1.6f,height:1f,response:1b,Tags:["sl","sl_i_rc_pluma"]}
summon text_display 33.5 225.5 84.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"El martillo y la pluma\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction 43.5 224 84.5 {width:1.6f,height:1f,response:1b,Tags:["sl","sl_i_rc_golf"]}
summon text_display 43.5 225.5 84.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Las pelotas de golf\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction 38.5 224 87.5 {width:1.6f,height:1f,response:1b,Tags:["sl","sl_i_rc_foto"]}
summon text_display 38.5 225.5 87.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"La foto de familia\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon item_display 45 224.05 88.5 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:stick",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]}}
summon interaction 45 224 88.5 {width:1.4f,height:0.7f,response:1b,Tags:["sl","sl_i_s_jabalina"]}
setblock 31 224 88 iron_bars
summon item_display 31.5 225.4 88.5 {Tags:["sl"],item_display:"none",billboard:"vertical",item:{id:"minecraft:spyglass",count:1},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]}}
summon interaction 31.5 224 88.5 {width:1f,height:1.9f,response:1b,Tags:["sl","sl_i_s_telescopio"]}
