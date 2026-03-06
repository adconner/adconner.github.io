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
      ];
    in
    {
      packages.${system} =
        let
          jekyll = pkgs.writeShellApplication {
            name = "jekyll";
            runtimeInputs = deps;
            text = ''
              if [ $# -eq 0 ]; then
                jekyll build
              else
                jekyll "$@"
              fi
            '';
          };
        in
        {
          default = jekyll;
        };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = deps;
      };
    };
}
