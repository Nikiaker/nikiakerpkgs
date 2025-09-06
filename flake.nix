{
  description = "A definition of packages made by Nikiaker";

  inputs = {
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
    nikiaker-hello-world = inputs.nikiaker-hello-world.nikiaker-hello-world;
    vita3k = inputs.vita3k.vita3k;

    packages.${system}.nikiaker-hello-world = self.nikiaker-hello-world;
    packages.${system}.vita3k = self.vita3k;
  };
}
