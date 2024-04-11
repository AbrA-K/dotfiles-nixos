{config, pkgs, ...} : {
  environment.systemPackages = with pkgs; [
    zathura-with-plugins
  ];
}
