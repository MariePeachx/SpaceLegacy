# Lunokhod 1, a tamaño real. Centro: -85, 20.5. Mira al este.
fill -91 224 16 -80 229 24 air
summon item_display -85 225.32 20.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":7}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.067f,1.067f,1.067f]}}
fill -95 224 19 -88 224 19 gray_carpet
fill -95 224 21 -88 224 21 gray_carpet
summon interaction -85.3 224 19.6 {width:0.8f,height:0.7f,response:1b,Tags:["sl","sl_i_lk_rueda"]}
summon text_display -85.3 224.95 18.8 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Ocho ruedas\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction -86.2 225.2 20.5 {width:1.3f,height:1.1f,response:1b,Tags:["sl","sl_i_lk_tapa"]}
summon text_display -86.6 226.9 20.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Tapa con panel solar\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction -84 224.5 20.5 {width:0.7f,height:0.6f,response:1b,Tags:["sl","sl_i_lk_retro"]}
summon text_display -83.4 225.6 20.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Retrorreflector francés\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
setblock -82 224 23 oak_sign[rotation=8]{is_waxed:1b,front_text:{messages:['{"text":""}','{"text":"VENDIDO"}','{"text":"68.500 $"}','{"text":""}']}}
summon interaction -81.5 224 23.5 {width:1f,height:1.5f,response:1b,Tags:["sl","sl_i_s_vendido"]}
