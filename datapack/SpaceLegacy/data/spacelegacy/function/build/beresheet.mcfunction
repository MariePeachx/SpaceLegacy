# Beresheet: lugar del choque
summon item_display -45.5 223.073 -87.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":14}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.867f,0.867f,0.867f]}}
setblock -45 221 -88 coal_block
setblock -45 221 -89 coal_block
setblock -46 221 -87 coal_block
summon item_display -43.5 222.05 -88.5 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:music_disc_strad",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f]}}
summon item_display -44.5 222.05 -86.5 {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:turtle_egg",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
fill -40 224 -90 -36 227 -86 air
setblock -38 224 -88 polished_andesite_slab
summon text_display -37.5 225.4 -87.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"La selfi\\n","color":"yellow","bold":true},{"text":"«País pequeño, grandes sueños»","color":"gray","bold":false}]'}
summon interaction -45.5 222 -87.5 {width:1.3f,height:1.2f,response:1b,Tags:["sl","sl_i_be_restos"]}
summon text_display -45.5 223.8 -87.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Los restos\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction -43.5 222 -88.5 {width:1.1f,height:0.9f,response:1b,Tags:["sl","sl_i_be_disco"]}
summon text_display -43.5 223.2 -89.3 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"La Biblioteca Lunar\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction -44.5 222 -86.5 {width:1.1f,height:0.9f,response:1b,Tags:["sl","sl_i_be_tardi"]}
summon text_display -44.5 223.2 -85.7 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Los tardígrados\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
