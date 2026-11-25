{
  description = "Shared Home Manager configuration for dojo laptops";

  outputs = { self, ... }: {
    homeManagerModules.default = { config, pkgs, lib, ... }: {
      # Packages installed for both Sensei and Ninja
      home.packages = with pkgs; [
        vim
      ];

      # Programs configured for both Sensei and Ninja
      programs = {
        git = {
          enable = true;
          extraConfig = {
            init.defaultBranch = "main";
          };
        };

        bash = {
          enable = true;
          shellAliases = { };
        };
      };

      targets.genericLinux.enable = true;
    };
  };
}
