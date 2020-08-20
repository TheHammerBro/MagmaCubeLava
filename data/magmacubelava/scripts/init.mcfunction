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

# install scoreboards
function magmacubelava:scripts/install

# init message
tellraw @a {"text": "MagmaCubeLava enabled\n use - function magmacubelava:scripts/uninstall - to disable", "color": "blue"}

# init flag set
scoreboard players set $init magcubelava_init 1