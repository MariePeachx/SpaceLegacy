# Estación ALSEP. Centro: -45, -20
fill -52 224 -27 -38 228 -13 air
summon item_display -44.5 224.99 -19.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":3}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f]}}
summon item_display -48.5 224.495 -19.5 {Tags:["sl"],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":4}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.4f,0.4f,0.4f]}}
fill -47 224 -20 -46 224 -20 redstone_wire
fill -43 224 -18 -43 224 -17 redstone_wire
fill -42 224 -18 -40 224 -16 white_carpet
setblock -41 224 -17 smooth_quartz_slab
setblock -42 224 -25 end_rod
setblock -42 225 -25 end_rod
setblock -42 226 -25 iron_bars
summon text_display -41.5 227.4 -24.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Magnetómetro\\n","color":"yellow","bold":true},{"text":"Midió el campo magnético lunar","color":"gray","bold":false}]'}
setblock -47 224 -15 chiseled_quartz_block
summon text_display -46.5 225.6 -14.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Viento solar\\n","color":"yellow","bold":true},{"text":"Contó partículas llegadas del Sol","color":"gray","bold":false}]'}
summon interaction -48.5 224 -19.5 {width:1.2f,height:1.3f,response:1b,Tags:["sl","sl_i_rtg"]}
summon text_display -48.5 225.8 -19.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Generador SNAP-27\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction -44.5 224 -19.5 {width:1.2f,height:2.2f,response:1b,Tags:["sl","sl_i_central"]}
summon text_display -44.5 226.6 -19.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Estación central\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
summon interaction -40.5 224 -16.5 {width:3.2f,height:0.8f,response:1b,Tags:["sl","sl_i_sismo"]}
summon text_display -40.5 225.4 -16.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Sismómetro\\n","color":"yellow","bold":true},{"text":"Clic derecho: escuchar","color":"aqua","bold":false}]'}
setblock -50 224 -25 dispenser[facing=up]
summon interaction -49.5 224 -24.5 {width:1.2f,height:1.2f,response:1b,Tags:["sl","sl_i_s_mortero"]}
