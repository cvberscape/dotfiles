if status --is-interactive
    alias c='clear'
    alias e='yazi'
    alias l='eza -lh --icons=auto'
    alias ls='eza --icons=auto'
    alias lsh='eza -a --icons=auto'
    alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
    alias ld='eza -lhD --icons=auto'
    alias grep='grep --color=auto'
    alias vim='nvim'
    alias py='python'
    alias mkdir='mkdir -p'
    alias tauri='env WEBKIT_DISABLE_DMABUF_RENDERER=1 bun tauri dev'
    alias tauribuild='bun tauri build --no-bundle'
    alias cd='z'
    alias android='bun expo run:android'

    set -gx EDITOR nvim
    set -gx ANDROID_HOME $HOME/Android/Sdk
    set -gx PATH $PATH $ANDROID_HOME/emulator $ANDROID_HOME/platform-tools
    set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk
    set -gx PATH $JAVA_HOME/bin $PATH

    function sudo
        set cmd $argv
        if test $cmd[1] = vim
            set cmd[1] nvim
        end
        command sudo $cmd
    end

    starship init fish | source
    zoxide init fish | source
    atuin init fish | source

    set -U fish_greeting ""

    clear
    command fastfetch

end
