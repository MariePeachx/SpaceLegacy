# Etapa de descenso del Eagle (Apolo 11), a tamaño real. Centro: 40, 0
fill 33 224 -7 51 230 8 air
summon item_display 40.5 227.96 0.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":1}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3.2f,3.2f,3.2f]}}
# Huellas hacia los experimentos y la bandera
setblock 45 224 -2 gray_carpet
setblock 44 224 -4 gray_carpet
setblock 43 224 -6 gray_carpet
setblock 46 224 2 gray_carpet
setblock 47 224 3 gray_carpet
# Cámara de TV sobre su trípode
setblock 49 224 -3 iron_bars
setblock 49 225 -3 observer[facing=west]
summon text_display 49.5 226.6 -2.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Cámara de TV\\n","color":"yellow","bold":true},{"text":"Medio planeta estaba mirando","color":"gray","bold":false}]'}
# Bandera, tumbada por el despegue
fill 46 224 5 47 224 5 lightning_rod[facing=east]
setblock 48 224 5 blue_carpet
fill 49 224 5 50 224 5 red_carpet
fill 48 224 6 50 224 6 white_carpet
summon text_display 48.5 225.4 5.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"La bandera\\n","color":"yellow","bold":true},{"text":"El despegue la tumbó","color":"gray","bold":false}]'}
summon item_display 42.5 224.412 -8.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":17}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.333f,0.333f,0.333f]}}
setblock 47 224 -10 chiseled_quartz_block
setblock 46 224 -10 light_blue_carpet
setblock 48 224 -10 light_blue_carpet
summon text_display 47.5 225.6 -9.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Sismómetro\\n","color":"yellow","bold":true},{"text":"Funcionó unas semanas","color":"gray","bold":false}]'}
summon interaction 40.5 224 0.5 {width:1.5f,height:1.6f,response:1b,Tags:["sl","sl_i_motor"]}
summon text_display 40.5 224.5 0.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Motor de descenso\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction 44.2 224 0.5 {width:1.4f,height:2.6f,response:1b,Tags:["sl","sl_i_placa"]}
summon text_display 45.2 226.6 0.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Placa de la escalera\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction 42.5 224 -8.5 {width:1.1f,height:1f,response:1b,Tags:["sl","sl_i_lrrr"]}
summon text_display 42.5 225.4 -8.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Retrorreflector láser\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon item_display 35.3 224.05 -4.6 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:leather",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]}}
summon item_display 35.8 224.05 -4.2 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:leather",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.6f,0.6f,0.6f]}}
summon interaction 35.5 224 -4.5 {width:1.2f,height:0.8f,response:1b,Tags:["sl","sl_i_s_bolsas"]}
summon item_display 45.5 224.05 3.5 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:gold_nugget",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.6f,0.6f,0.6f]}}
summon interaction 45.5 224 3.5 {width:1f,height:0.8f,response:1b,Tags:["sl","sl_i_s_olivo"]}
summon item_display 46.5 224.05 -3.5 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:heavy_weighted_pressure_plate",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
summon interaction 46.5 224 -3.5 {width:1f,height:0.8f,response:1b,Tags:["sl","sl_i_s_disco"]}
summon item_display 36.3 224.05 4.4 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:leather_boots",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]}}
summon item_display 36.9 224.05 4.8 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:leather_chestplate",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]}}
summon interaction 36.5 224 4.5 {width:1.2f,height:0.8f,response:1b,Tags:["sl","sl_i_s_mochilas"]}
