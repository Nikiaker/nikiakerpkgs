{
  description = "A definition of packages made by Nikiaker";

  inputs = {
    nikiaker-hello-world.url = "github:Nikiaker/nikiaker-hello-world?ref=main";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let 
    system = "x86_64-linux";
  in 
  {
    packages.${system}.nikiaker-hello-world = inputs.nikiaker-hello-world.nikiaker-hello-world;
    
    nikiaker-hello-world = self.packages.${system}.nikiaker-hello-world;
  };
}
