{
  description = "A definition of packages made by Nikiaker";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nikiaker-hello-world = {
      url = "git+ssh://git@github.com/Nikiaker/nikiaker-hello-world?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vita3k = {
      url = "git+ssh://git@github.com/Nikiaker/vita3k-flake?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs: 
  let 
    system = "x86_64-linux";
  in 
  {
    # Package definitions
    nikiaker-hello-world = inputs.nikiaker-hello-world.nikiaker-hello-world;
    vita3k = inputs.vita3k.vita3k;

    # Overlays to integrate with nixpkgs
    overlays = [ 
      (final: prev: { nikiakerpkgs.nikiaker-hello-world = self.nikiaker-hello-world; })
      (final: prev: { nikiakerpkgs.vita3k = self.vita3k; })
    ];

    # Flake packages for testing (nix build .#packageName)
    packages.${system} = {
      nikiaker-hello-world = self.nikiaker-hello-world;
      vita3k = self.vita3k;
    };
  };
}
