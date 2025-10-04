source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
set -x ANDROID_HOME $HOME/Development/android
fish_add_path $HOME/Development/flutter/bin
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path $ANDROID_HOME/emulator
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $HOME/.npm-global/bin
fish_add_path /home/maelstrom/.local/bin

pyenv init - fish | source
