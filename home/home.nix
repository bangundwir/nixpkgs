{ pkgs, ... }: {
  home.username = "hades";
  home.homeDirectory = "/home/hades";
  home.packages = with pkgs; [
    cowsay
    bat
    ranger
    vim
    btop
    gdu

    zsh
    neofetch
    unzip
    fzf
    fzf-zsh

   ##
    direnv
    nix-direnv

  ];
  home.stateVersion = "22.11"; # To figure this out you can comment out the line and see what version it expected.
  programs.home-manager.enable = true;
  # font.fontconfig.enable = true;
  programs = {
    direnv = {
      enable = true;
      # enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    bash.enable = true; # see note on other shells below
  };
}
