{ pkgs, pkgs-stable, ... }: {
    imports = [
        ./browser
	    ./dev
        ./file
        ./games
        ./multimedia
        ./shell
        ./social
    ];

    # Other apps
    home.packages = (with pkgs; [
        onlyoffice-bin
        helvum
        virt-manager
        lzip
        gnome-clocks
        obsidian
    ]) ++ (with pkgs-stable; [
        # quickemu
        # quickgui
    ]);
}
