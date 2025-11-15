{ config, pkgs, ... }:

{
  home.username = "cvberscape";
  home.homeDirectory = "/home/cvberscape";

  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  home.packages = with pkgs; [
    android-studio
    brave 
    bun 
    stdenv.cc.cc.lib
    watchman
    vesktop
    heroic
    catppuccin-cursors.mochaSky
    code-cursor
    claude-code
    carapace
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
