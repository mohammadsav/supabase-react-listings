{
  description = "Web dev environment for Crash Course: Full-Stack Web App";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            vscodium          # Preffered IDE
            nodejs_20       # For React, JS, npm
            yarn            # Optional but often used with React
            supabase-cli    # For interacting with Supabase
            git             # Always helpful for version control
            python3         # In case any tooling relies on it (some dev tools do)
            http-server     # Node-based static server to serve HTML/CSS/JS locally
          ];

          shellHook = ''
            echo "✅ Web Dev environment ready. Use 'http-server' to preview, 'supabase' for backend tasks."
          '';
        };
      });
}
