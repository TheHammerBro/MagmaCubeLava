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
    
# effects for hot cubes
#execute as @s[scores={magcubelava_heat=1000..}] at @s run particle soul_fire_flame ~ ~ ~ .1 .1 .1 .1 2 normal
#execute as @s[scores={magcubelava_heat=2000..}] at @s run particle soul_fire_flame ~ ~ ~ .1 .1 .1 .1 2 normal
#execute as @s[scores={magcubelava_heat=3000..}] at @s run particle soul_fire_flame ~ ~ ~ .1 .1 .1 .1 2 normal
#execute as @s[scores={magcubelava_heat=4000..}] at @s run particle soul_fire_flame ~ ~ ~ .1 .1 .1 .1 2 normal

# recursively creates particle effects as heat builds
    # effect to displat
    particle soul_fire_flame ~ ~ ~ .1 .1 .1 .1 2 normal

    # recursion
    scoreboard players remove @s magcubelava_heat 1000
    execute if score @s magcubelava_heat matches 1000.. run function magmacubelava:hotcubeeffect
    scoreboard players add @s magcubelava_heat 1000