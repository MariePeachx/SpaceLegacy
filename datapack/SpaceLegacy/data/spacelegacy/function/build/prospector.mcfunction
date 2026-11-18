# Lunar Prospector y las cenizas de Gene Shoemaker
summon item_display 60.5 222.98 95.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":15}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.6f,1.6f,1.6f]}}
setblock 59 220 94 blue_ice
setblock 58 220 95 packed_ice
setblock 60 220 97 packed_ice
setblock 59 220 96 blue_ice
setblock 61 221 96 decorated_pot
summon interaction 60.5 221 95.5 {width:1.4f,height:1.5f,response:1b,Tags:["sl","sl_i_lp_sonda"]}
summon text_display 60.5 223 95.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"La sonda\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction 59.5 221 94.5 {width:1.1f,height:0.5f,response:1b,Tags:["sl","sl_i_lp_hielo"]}
summon text_display 58.4 222.2 93.6 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"El hielo\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction 61.5 221 96.5 {width:1.1f,height:1.4f,response:1b,Tags:["sl","sl_i_lp_urna"]}
summon text_display 62.2 222.8 97.2 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"La cápsula\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
