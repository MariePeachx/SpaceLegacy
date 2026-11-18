schedule function spacelegacy:second 20t replace
execute as @a at @s if dimension spacelegacy:moon run function spacelegacy:moon/on_moon
execute as @a[tag=sl_onmoon] at @s unless dimension spacelegacy:moon run function spacelegacy:moon/leave
execute in spacelegacy:moon as @a[tag=!sl_m1_found,x=26,y=216,z=-14,dx=28,dy=30,dz=28] at @s run function spacelegacy:m1/found
execute in spacelegacy:moon as @a[tag=!sl_m2_found,x=-20,y=216,z=35,dx=20,dy=30,dz=20] at @s run function spacelegacy:m2/found
execute in spacelegacy:moon as @a[tag=!sl_m3_found,x=-57,y=216,z=-32,dx=24,dy=30,dz=24] at @s run function spacelegacy:m3/found
execute in spacelegacy:moon as @a[tag=!sl_m4_found,x=77,y=216,z=-41,dx=22,dy=30,dz=22] at @s run function spacelegacy:m4/found
execute in spacelegacy:moon as @a[tag=!sl_m5_found,x=27,y=216,z=73,dx=22,dy=30,dz=22] at @s run function spacelegacy:m5/found
execute in spacelegacy:moon as @a[tag=!sl_m6_found,x=-97,y=216,z=-77,dx=24,dy=30,dz=24] at @s run function spacelegacy:m6/found
execute in spacelegacy:moon as @a[tag=!sl_m7_found,x=-96,y=216,z=9,dx=22,dy=30,dz=22] at @s run function spacelegacy:m7/found
execute in spacelegacy:moon as @a[tag=!sl_m8_found,x=80,y=216,z=60,dx=22,dy=30,dz=22] at @s run function spacelegacy:m8/found
execute in spacelegacy:moon as @a[tag=!sl_m9_found,x=21,y=216,z=-95,dx=22,dy=30,dz=22] at @s run function spacelegacy:m9/found
execute in spacelegacy:moon as @a[tag=!sl_m10_found,x=-50,y=216,z=74,dx=22,dy=30,dz=22] at @s run function spacelegacy:m10/found
execute in spacelegacy:moon as @a[tag=!sl_m11_found,x=-55,y=216,z=-98,dx=20,dy=30,dz=20] at @s run function spacelegacy:m11/found
execute in spacelegacy:moon as @a[tag=!sl_m12_found,x=50,y=216,z=85,dx=20,dy=30,dz=20] at @s run function spacelegacy:m12/found
