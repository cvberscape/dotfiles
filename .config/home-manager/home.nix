{ config, pkgs, ... }:

{
  home.username = "cvberscape";
  home.homeDirectory = "/home/cvberscape";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    android-studio
    brave 
    bun 
    watchman
    vesktop
    heroic
    catppuccin-cursors.mochaSky
    code-cursor
    claude-code
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
