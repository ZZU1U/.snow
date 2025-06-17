{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "about:blank";
        };
        search = {
          force = true;
          engines = {
            "nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              definedAliases = [ "@np" ];
            };
            "nixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };
            "bing".metaData.hidden = true;
            "google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
          };
        };
        # extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        #   ublock-origin
        #   darkreader
        #   vimium
        #   df-youtube
        #   foxyproxy-standard
        # ];
      };
    };
  };
}
