# Hyprland-pywal

My personal dotfiles, adapts entire system theme depending on pywal colorscheme via useful scripts

## store

store file lists all explicitly installed packages via yay

```nu
yay -Qeq | save -f store
```

## usage

symlink files

```nu
stow -t $env.HOME .
```

install packages from store
