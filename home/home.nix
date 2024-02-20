{pkgs, ...}: {
    home.username = "hades";
    home.homeDirectory = "/home/hades";
    home.packages = [
        pkgs.cowsay
        pkgs.bat

    ];
    home.stateVersion = "22.11"; # To figure this out you can comment out the line and see what version it expected.
    programs.home-manager.enable = true;
}
