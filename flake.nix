{
  description = "idk what I'm doing";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05"; # Some apps sometimes broken on unstable
      
    home-manager = {
     url = "github:nix-community/home-manager";
     inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    stylix.url = "github:danth/stylix";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, home-manager, stylix, nixpkgs-stable, hyprland, ...}@inputs: 
  let
    inherit (self) outputs;
    system = "x86_64-linux";
    # pkgs = import nixpkgs {
    #   inherit system;
    #   overlays = [
    #     inputs.hyprpanel.overlay.${system}
    #   ];
    # };
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = import nixpkgs-stable { inherit system; config.allowUnfree = true; };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { 
        inherit inputs outputs system;
        inherit pkgs-stable;
      };
      modules = [ 
        stylix.nixosModules.stylix
        ./nixos/configuration.nix
        ({ inputs, config, pkgs, ...}: {
          nixpkgs.overlays = [
            inputs.hyprpanel.overlay
          ];
          environment.systemPackages = with pkgs; [ hyprpanel ];
        })
      ];
    };
  };
}