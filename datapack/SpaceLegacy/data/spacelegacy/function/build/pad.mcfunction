# Base Legado: pista de llegada y terminal de ECO
fill -9 224 -9 9 230 9 air
fill -2 223 -7 2 223 -7 smooth_stone
fill -4 223 -6 4 223 -6 smooth_stone
fill -5 223 -5 5 223 -5 smooth_stone
fill -6 223 -4 6 223 -4 smooth_stone
fill -6 223 -3 6 223 -3 smooth_stone
fill -7 223 -2 7 223 -2 smooth_stone
fill -7 223 -1 7 223 -1 smooth_stone
fill -7 223 0 7 223 0 smooth_stone
fill -7 223 1 7 223 1 smooth_stone
fill -7 223 2 7 223 2 smooth_stone
fill -6 223 3 6 223 3 smooth_stone
fill -6 223 4 6 223 4 smooth_stone
fill -5 223 5 5 223 5 smooth_stone
fill -4 223 6 4 223 6 smooth_stone
fill -2 223 7 2 223 7 smooth_stone
fill -2 223 -5 2 223 -5 gray_concrete
fill -3 223 -4 3 223 -4 gray_concrete
fill -4 223 -3 4 223 -3 gray_concrete
fill -5 223 -2 5 223 -2 gray_concrete
fill -5 223 -1 5 223 -1 gray_concrete
fill -5 223 0 5 223 0 gray_concrete
fill -5 223 1 5 223 1 gray_concrete
fill -5 223 2 5 223 2 gray_concrete
fill -4 223 3 4 223 3 gray_concrete
fill -3 223 4 3 223 4 gray_concrete
fill -2 223 5 2 223 5 gray_concrete
fill -1 223 -2 1 223 -2 yellow_concrete
fill -2 223 -1 2 223 -1 yellow_concrete
fill -2 223 0 2 223 0 yellow_concrete
fill -2 223 1 2 223 1 yellow_concrete
fill -1 223 2 1 223 2 yellow_concrete
setblock 0 223 0 sea_lantern
setblock 5 223 5 sea_lantern
setblock 5 224 5 iron_bars
setblock 5 225 5 end_rod
setblock -5 223 5 sea_lantern
setblock -5 224 5 iron_bars
setblock -5 225 5 end_rod
setblock 5 223 -5 sea_lantern
setblock 5 224 -5 iron_bars
setblock 5 225 -5 end_rod
setblock -5 223 -5 sea_lantern
setblock -5 224 -5 iron_bars
setblock -5 225 -5 end_rod
# Terminal de ECO
setblock 3 224 -3 lodestone
setblock 3 225 -3 sea_lantern
setblock 3 226 -3 lightning_rod
summon interaction 3.5 224 -2.5 {width:1.4f,height:2.2f,response:1b,Tags:["sl","sl_i_eco"]}
summon text_display 3.5 227.4 -2.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"ECO\\n","color":"aqua","bold":true},{"text":"Clic derecho: hablar","color":"white","bold":false}]'}
summon text_display 0.5 229.2 0.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"BASE LEGADO","color":"gold","bold":true}]',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,2f,2f]}}
summon text_display 6.5 225.6 0.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"ESTE\\n","color":"aqua","bold":true},{"text":"The Eagle","color":"white","bold":false}]'}
summon text_display 0.5 225.6 6.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"SUR\\n","color":"aqua","bold":true},{"text":"Lunar Rover","color":"white","bold":false}]'}
summon text_display -5.5 225.6 0.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"OESTE\\n","color":"aqua","bold":true},{"text":"Estación ALSEP","color":"white","bold":false}]'}
summon text_display 0.5 225.6 -5.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"NORTE\\n","color":"aqua","bold":true},{"text":"Museo Space Legacy","color":"white","bold":false}]'}
