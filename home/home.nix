{pkgs, ...}: {
    home.username = "hades";
    home.homeDirectory = "/home/hades";
    home.packages = with pkgs; [
        cowsay
        bat
        ranger

        #font
        fira-code

    ];
    home.stateVersion = "22.11"; # To figure this out you can comment out the line and see what version it expected.
    programs.home-manager.enable = true;
    font.fontconfig.enable = true;
}
