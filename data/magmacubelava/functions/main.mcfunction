##############################################################################################
#                                                                                            #
#  _____  _             _   _                                           ______               #
# |_   _|| |           | | | |                                          | ___ \              #
#   | |  | |__    ___  | |_| |  __ _  _ __ ___   _ __ ___    ___  _ __  | |_/ / _ __   ___   #
#   | |  | '_ \  / _ \ |  _  | / _` || '_ ` _ \ | '_ ` _ \  / _ \| '__| | ___ \| '__| / _ \  #
#   | |  | | | ||  __/ | | | || (_| || | | | | || | | | | ||  __/| |    | |_/ /| |   | (_) | #
#   \_/  |_| |_| \___| \_| |_/ \__,_||_| |_| |_||_| |_| |_| \___||_|    \____/ |_|    \___/  #
#                                                                                            #
#                                                                                            #
#   Author : Ryan Hammer                                                                     #
#   Project: https://github.com/TheHammerBro/MC_magmacubelava                                #
#                                                                                            #
##############################################################################################

# initilization
    scoreboard objectives add magcubelava_init dummy "Magma Cube Lava Init Boolean"
    execute unless score $init init_bool matches 1 run function magmacubelava:scripts/init

# loop
    # give new magma cubes magcubelava_heat score
    scoreboard players add @e[type=magma_cube] magcubelava_heat 0

    # heat up
    execute as @e[type=magma_cube] at @s if block ~ ~-.5 ~ magma_block run function magmacubelava:heatup

    # effects for hot cubes
    execute as @e[scores={magcubelava_heat=1000..}] at @s run function magmacubelava:hotcubeeffect
    
    #convert obsidian
    execute as @e[scores={magcubelava_heat=1000..}] at @s if block ~ ~-.5 ~ obsidian run function magmacubelava:convert

#    # size dependant heating
#    execute as @e[nbt={Size: 0},scores={magcubelava_heat=..1000}] at @s if block ~ ~-.25 ~ magma_block run scoreboard players add @s magcubelava_heat 1
#    execute as @e[nbt={Size: 1},scores={magcubelava_heat=..2000}] at @s if block ~ ~-.25 ~ magma_block run scoreboard players add @s magcubelava_heat 1
#    execute as @e[nbt={Size: 3},scores={magcubelava_heat=..4000}] at @s if block ~ ~-.25 ~ magma_block run scoreboard players add @s magcubelava_heat 2
#
#    # tag cubes with enough heat
#    execute as @e[scores={magcubelava_heat=1000..}] run tag @s add 2hot2handle
#
#    # tag hot cubes on obsidian
#    execute as @e[tag=2hot2handle] if block ~ ~-.5 ~ obsidian run tag @s add hot_as_lava
#
#    # convert Obsidian to lava (size dependant)
#    execute as @e[tag=hot_as_lava,nbt={Size: 0}] run fill ~-.1 ~-.25 ~-.1 ~.1 ~-.25 ~.1 lava replace obsidian
#    execute as @e[tag=hot_as_lava,nbt={Size: 1}] run fill ~-.3 ~-.25 ~-.3 ~.3 ~-.25 ~.3 lava replace obsidian
#    execute as @e[tag=hot_as_lava,nbt={Size: 3}] run fill ~-.6 ~-.25 ~-.6 ~.6 ~-.25 ~.6 lava replace obsidian
#
#    # remove 1000 heat and hot_as_lava
#    execute as @e[tag=hot_as_lava] run scoreboard players remove @s magcubelava_heat 1000
#    execute as @e[tag=hot_as_lava,scores={magcubelava_heat=..999}] run tag @s remove 2hot2handle
#
#    # conversion effects
#    execute as @e[tag=hot_as_lava] at @s run particle soul_fire_flame ~ ~ ~ .1 .1 .1 1 100 normal
#    execute as @e[tag=hot_as_lava] at @s run playsound block.fire.extinguish block @a ~ ~ ~ 2 1.2
#
#    # remove hot_as_lava
#    execute as @e[tag=hot_as_lava] run tag @s remove hot_as_lava