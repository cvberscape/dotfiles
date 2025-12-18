# env.nu
#
# Installed by:
# version = "0.108.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
if ($env.PWD | str contains "reposcape") {
    let nix_lib = ($env.HOME | path join ".nix-profile/lib")
    $env.LD_LIBRARY_PATH = ([
        "/usr/lib"
        "/usr/lib32"
        $nix_lib
    ] 
    | where {|row| ($row | path exists)} 
    | str join ":")
}
$env.LD_LIBRARY_PATH = ($env.HOME + "/.nix-profile/lib")

mkdir $"($nu.cache-dir)"
carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
zoxide init nushell --cmd=cd | save -f ~/.zoxide.nu 
