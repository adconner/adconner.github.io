{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs, }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      gems = pkgs.bundlerEnv {
        name = "adconner.github.io";
        gemdir = ./.;
      };
      deps = with pkgs; [
        gems
        gems.wrappedRuby
        bundix
        texliveBasic
        yq
        jq
        gron
        pandoc
      ];
    in
    {
      packages.${system} =
        let
          build = pkgs.writeShellApplication {
            name = "build";
            runtimeInputs = deps;
            text = ''
              make
              jekyll build
              make clean
            '';
          };
          serve = pkgs.writeShellApplication {
            name = "build";
            runtimeInputs = deps;
            text = ''
              make
              jekyll serve
            '';
          };
        in
        {
          default = build;
          build = build;
          serve = serve;
        };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = deps;
      };
    };
}
