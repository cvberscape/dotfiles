# Hyprland-pywal

My personal dotfiles, adapts entire system theme depending on pywal colorscheme via useful scripts

> [!NOTE]
> all commands are for nushell

## usage

symlink files

```nu
stow -t $env.HOME .
```

install packages from store

```nu
open store | ^yay -S --needed -

```

## store

store file lists all explicitly installed packages via yay

```nu
yay -Qeq | save -f store
```
