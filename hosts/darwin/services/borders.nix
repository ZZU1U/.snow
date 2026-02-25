{ stillPkgs, ... }: {
  services.jankyborders = {
    enable = false;
    package = stillPkgs.jankyborders;
  };
}
