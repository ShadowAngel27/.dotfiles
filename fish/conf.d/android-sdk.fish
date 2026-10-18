set -gx ANDROID_HOME "$HOME/Android/Sdk"
set -gx ANDROID_SDK_ROOT "$HOME/Android/Sdk"

fish_add_path --move --path "$ANDROID_HOME/cmdline-tools/latest/bin"
fish_add_path --move --path "$ANDROID_HOME/platform-tools"
