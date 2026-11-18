# Luna 2, dentro de su cráter de impacto. Centro: -85, -65
summon item_display -84.5 222.99 -64.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":6}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f]}}
setblock -83 222 -63 waxed_chiseled_copper
setblock -86 222 -63 heavy_weighted_pressure_plate
setblock -84 222 -67 heavy_weighted_pressure_plate
setblock -87 222 -66 heavy_weighted_pressure_plate
fill -79 224 -72 -74 227 -67 air
setblock -77 224 -70 iron_block
setblock -76 224 -70 cauldron
setblock -77 224 -69 iron_bars
setblock -75 224 -68 iron_trapdoor
setblock -78 224 -71 light_gray_concrete
summon interaction -84.5 222 -64.5 {width:1.2f,height:1.3f,response:1b,Tags:["sl","sl_i_l2_sonda"]}
summon text_display -84.5 224.2 -64.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"La sonda\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction -82.5 222 -62.5 {width:1.3f,height:1.2f,response:1b,Tags:["sl","sl_i_l2_banderin"]}
summon text_display -82.5 223.6 -62.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Los banderines\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction -76.5 224 -69.5 {width:1.5f,height:1.3f,response:1b,Tags:["sl","sl_i_l2_etapa"]}
summon text_display -76.5 225.9 -69.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"La tercera etapa\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
