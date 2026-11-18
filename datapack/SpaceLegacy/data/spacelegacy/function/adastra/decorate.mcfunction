# Detalles con bloques y vehículos de Ad Astra
fill -1 223 8 1 223 10 ad_astra:steel_plating
setblock 5 223 5 ad_astra:steel_block
setblock -5 223 5 ad_astra:steel_block
setblock 5 223 -5 ad_astra:steel_block
setblock -5 223 -5 ad_astra:steel_block
summon ad_astra:tier_1_rover 7.5 224 7.5 {Tags:["sl"],"fabric:attachments":{"ad_astra:fluids":[{id:"ad_astra:fuel",amount:243000L}]}}
summon text_display 7.5 227 7.5 {billboard:"center",alignment:"center",Tags:["sl"],text:'[{"text":"Rover de exploración\\n","color":"aqua","bold":true},{"text":"Súbete y conduce entre los ecos","color":"white","bold":false}]'}
# Globos en la entrada del museo
setblock -3 224 -35 polished_blackstone
setblock -3 225 -35 ad_astra:earth_globe
setblock 3 224 -35 polished_blackstone
setblock 3 225 -35 ad_astra:moon_globe
