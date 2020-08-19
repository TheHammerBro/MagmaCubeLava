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
    scoreboard objectives add init_bool dummy
    execute unless score $init init_bool matches 1 run function magmacubelava:scripts/init

# loop
    # add give magma_cubes heat score
    scoreboard players add @e[type=magma_cube] Heat 0

    # size dependant heating (rm get_hotter)
    execute as @e[nbt={Size: 0},scores={Heat=..1000}] at @s if block ~ ~-.25 ~ magma_block run scoreboard players add @s Heat 1
    execute as @e[nbt={Size: 1},scores={Heat=..2000}] at @s if block ~ ~-.25 ~ magma_block run scoreboard players add @s Heat 1
    execute as @e[nbt={Size: 3},scores={Heat=..4000}] at @s if block ~ ~-.25 ~ magma_block run scoreboard players add @s Heat 2

    # tag cubes with enough heat
    execute as @e[scores={Heat=1000..}] run tag @s add 2hot2handle

    # effects for hot cubes
#    execute as @e[tag=2hot2handle] run function

    # tag hot cubes on obsidian
    execute as @e[tag=2hot2handle] if block ~ ~-.025 ~ obsidian run tag @s add hot_as_lava

    # convert Obsidian to lava (size dependant)
    execute as @e[tag=hot_as_lava,nbt={Size: 0}] run fill ~ ~-.25 ~ ~ ~-.25 ~ lava replace obsidian
    execute as @e[tag=hot_as_lava,nbt={Size: 1}] run fill ~-.25 ~-.25 ~-.25 ~.25 ~-.25 ~.25 lava replace obsidian
    execute as @e[tag=hot_as_lava,nbt={Size: 3}] run fill ~-.65 ~-.25 ~-.65 ~.65 ~-.25 ~.65 lava replace obsidian

    # remove 1000 Heat and hot_as_lava
    execute as @e[tag=hot_as_lava] run scoreboard players remove @s Heat 1000
    execute as @e[tag=hot_as_lava,scores={Heat=..999}] run tag @s remove 2hot2handle

    # conversion effects
#    execute as @e[tag=hot_as_lava]

    # remove hot_as_lava
    execute as @e[tag=hot_as_lava] run tag @s remove hot_as_lava