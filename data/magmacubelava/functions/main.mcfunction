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
    execute unless score $MCL_init magcubelava_init matches 1 run function magmacubelava:scripts/init

# loop
    # give new magma cubes magcubelava_heat score
    scoreboard players add @e[type=magma_cube] magcubelava_heat 0

    # heat up
    execute as @e[type=magma_cube] at @s if block ~ ~-.5 ~ magma_block run function magmacubelava:heatup

    # effects for hot cubes
    execute as @e[scores={magcubelava_heat=1000..}] at @s run function magmacubelava:hotcubeeffect
    
    #convert obsidian
    execute as @e[scores={magcubelava_heat=1000..}] at @s if block ~ ~-.5 ~ obsidian run function magmacubelava:convert