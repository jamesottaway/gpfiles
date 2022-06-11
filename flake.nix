{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-22.05;
    home-manager.url = github:nix-community/home-manager/release-22.05;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, home-manager }: {
    homeConfigurations = {
      gitpod = home-manager.lib.homeManagerConfiguration {
        configuration = ./home.nix;
        system = "x86_64-linux";
        homeDirectory = "/home/gitpod";
        username = "gitpod";
        stateVersion = "22.05";
      };
    };
  };
}
