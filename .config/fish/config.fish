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
    #  set -gx PATH $HOME/.nix-profile/bin $HOME/.nix-profile/sbin $PATH

    bind -M default \cy commandline-copy # normal mode
    bind -M insert \cy commandline-copy # insert mode
    bind -M visual \cy commandline-copy # visual mode

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

# clean nix generations and garbage collect
function nix-clean
    home-manager expire-generations 0
    and nix-collect-garbage -d
end

# update nix channels and switch home-manager
function nix-update
    nix-channel --update
    and home-manager switch
end

# sync repos
function sync-repos
    set base_dir "$HOME/code"
    set -l failures

    for dir in $base_dir/*/
        if test -d "$dir/.git"
            set repo_name (basename "$dir")
            echo "Updating $repo_name"

            if not git -C "$dir" pull --ff-only
                set -a failures $repo_name
            end
        end
    end

    if test (count $failures) -eq 0
        echo "\nAll repositories updated successfully."
    else
        echo "\n===== SUMMARY OF FAILURES ====="
        for repo in $failures
            echo "$repo needs manual intervention"
        end
    end
end

function commandline-copy
    set -l cmd (commandline)
    if test -n "$cmd"
        set -l highlighted (echo $cmd | fish_indent --ansi)
        printf '```ansi\n%s\n```' "$highlighted" | wl-copy
    end
    commandline -f repaint
end
