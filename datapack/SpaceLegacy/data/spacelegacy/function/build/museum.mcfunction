# Museo Space Legacy. Entrada al sur.
fill -12 224 -55 12 231 -32 air
fill -12 223 -55 12 223 -33 smooth_quartz
fill -11 223 -54 11 223 -34 polished_deepslate
fill -1 223 -54 1 223 -33 smooth_quartz
fill -12 224 -55 12 228 -55 white_concrete
fill -12 224 -33 12 228 -33 white_concrete
fill -12 224 -55 -12 228 -33 white_concrete
fill 12 224 -55 12 228 -33 white_concrete
fill -12 225 -53 -12 227 -35 light_blue_stained_glass
fill 12 225 -53 12 227 -35 light_blue_stained_glass
fill -1 224 -33 1 226 -33 air
fill -12 229 -55 12 229 -33 white_stained_glass
setblock -6 223 -49 sea_lantern
setblock -6 223 -43 sea_lantern
setblock -6 223 -37 sea_lantern
setblock 0 223 -49 sea_lantern
setblock 0 223 -43 sea_lantern
setblock 0 223 -37 sea_lantern
setblock 6 223 -49 sea_lantern
setblock 6 223 -43 sea_lantern
setblock 6 223 -37 sea_lantern
setblock -9 224 -52 polished_blackstone
setblock -3 224 -52 polished_blackstone
setblock 3 224 -52 polished_blackstone
setblock 9 224 -52 polished_blackstone
setblock -9 224 -46 polished_blackstone
setblock -3 224 -46 polished_blackstone
setblock 3 224 -46 polished_blackstone
setblock 9 224 -46 polished_blackstone
setblock -9 224 -40 polished_blackstone
setblock -3 224 -40 polished_blackstone
setblock 3 224 -40 polished_blackstone
setblock 9 224 -40 polished_blackstone
summon text_display 0.5 230.6 -32.4 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"MUSEO SPACE LEGACY\\n","color":"gold","bold":true},{"text":"Not everything returns from space","color":"gray","bold":false,"italic":true}]',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.6f,1.6f,1.6f]}}
summon text_display -7 227.4 -32.4 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"MURO DEL LEGADO\\n","color":"gold","bold":true},{"text":"Quienes recuperaron los 12 ecos","color":"gray","bold":false}]'}
summon text_display 7 226.4 -32.4 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Próximamente\\n","color":"light_purple","bold":true},{"text":"Marte: los ecos de Sojourner","color":"white","bold":false}]'}
execute unless score #m1 sl_global matches 1 run summon text_display -8.5 226.2 -51.5 {billboard:"center",alignment:"center",Tags:["sl","sl_lock_m1"],text:'[{"text":"Sala cerrada\\n","color":"red","bold":true},{"text":"Falta el eco 01","color":"gray","bold":false}]'}
execute if score #m1 sl_global matches 1 run function spacelegacy:museum/show_m1
execute unless score #m2 sl_global matches 1 run summon text_display -2.5 226.2 -51.5 {billboard:"center",alignment:"center",Tags:["sl","sl_lock_m2"],text:'[{"text":"Sala cerrada\\n","color":"red","bold":true},{"text":"Falta el eco 02","color":"gray","bold":false}]'}
execute if score #m2 sl_global matches 1 run function spacelegacy:museum/show_m2
execute unless score #m3 sl_global matches 1 run summon text_display 3.5 226.2 -51.5 {billboard:"center",alignment:"center",Tags:["sl","sl_lock_m3"],text:'[{"text":"Sala cerrada\\n","color":"red","bold":true},{"text":"Falta el eco 03","color":"gray","bold":false}]'}
execute if score #m3 sl_global matches 1 run function spacelegacy:museum/show_m3
execute unless score #m4 sl_global matches 1 run summon text_display 9.5 226.2 -51.5 {billboard:"center",alignment:"center",Tags:["sl","sl_lock_m4"],text:'[{"text":"Sala cerrada\\n","color":"red","bold":true},{"text":"Falta el eco 04","color":"gray","bold":false}]'}
execute if score #m4 sl_global matches 1 run function spacelegacy:museum/show_m4
execute unless score #m5 sl_global matches 1 run summon text_display -8.5 226.2 -45.5 {billboard:"center",alignment:"center",Tags:["sl","sl_lock_m5"],text:'[{"text":"Sala cerrada\\n","color":"red","bold":true},{"text":"Falta el eco 05","color":"gray","bold":false}]'}
execute if score #m5 sl_global matches 1 run function spacelegacy:museum/show_m5
execute unless score #m6 sl_global matches 1 run summon text_display -2.5 226.2 -45.5 {billboard:"center",alignment:"center",Tags:["sl","sl_lock_m6"],text:'[{"text":"Sala cerrada\\n","color":"red","bold":true},{"text":"Falta el eco 06","color":"gray","bold":false}]'}
execute if score #m6 sl_global matches 1 run function spacelegacy:museum/show_m6
execute unless score #m7 sl_global matches 1 run summon text_display 3.5 226.2 -45.5 {billboard:"center",alignment:"center",Tags:["sl","sl_lock_m7"],text:'[{"text":"Sala cerrada\\n","color":"red","bold":true},{"text":"Falta el eco 07","color":"gray","bold":false}]'}
execute if score #m7 sl_global matches 1 run function spacelegacy:museum/show_m7
execute unless score #m8 sl_global matches 1 run summon text_display 9.5 226.2 -45.5 {billboard:"center",alignment:"center",Tags:["sl","sl_lock_m8"],text:'[{"text":"Sala cerrada\\n","color":"red","bold":true},{"text":"Falta el eco 08","color":"gray","bold":false}]'}
execute if score #m8 sl_global matches 1 run function spacelegacy:museum/show_m8
execute unless score #m9 sl_global matches 1 run summon text_display -8.5 226.2 -39.5 {billboard:"center",alignment:"center",Tags:["sl","sl_lock_m9"],text:'[{"text":"Sala cerrada\\n","color":"red","bold":true},{"text":"Falta el eco 09","color":"gray","bold":false}]'}
execute if score #m9 sl_global matches 1 run function spacelegacy:museum/show_m9
execute unless score #m10 sl_global matches 1 run summon text_display -2.5 226.2 -39.5 {billboard:"center",alignment:"center",Tags:["sl","sl_lock_m10"],text:'[{"text":"Sala cerrada\\n","color":"red","bold":true},{"text":"Falta el eco 10","color":"gray","bold":false}]'}
execute if score #m10 sl_global matches 1 run function spacelegacy:museum/show_m10
execute unless score #m11 sl_global matches 1 run summon text_display 3.5 226.2 -39.5 {billboard:"center",alignment:"center",Tags:["sl","sl_lock_m11"],text:'[{"text":"Sala cerrada\\n","color":"red","bold":true},{"text":"Falta el eco 11","color":"gray","bold":false}]'}
execute if score #m11 sl_global matches 1 run function spacelegacy:museum/show_m11
execute unless score #m12 sl_global matches 1 run summon text_display 9.5 226.2 -39.5 {billboard:"center",alignment:"center",Tags:["sl","sl_lock_m12"],text:'[{"text":"Sala cerrada\\n","color":"red","bold":true},{"text":"Falta el eco 12","color":"gray","bold":false}]'}
execute if score #m12 sl_global matches 1 run function spacelegacy:museum/show_m12
