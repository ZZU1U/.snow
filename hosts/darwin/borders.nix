{ stillPkgs, ... }: {
  services.jankyborders = {
    enable = true;
    package = stillPkgs.jankyborders;
  };
}
