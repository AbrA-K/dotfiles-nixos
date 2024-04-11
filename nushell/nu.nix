{config, pkgs} : {
  programs.nushell.enable = true;
  programs.yazi{
    enable = true;
    NushellIntegration = true;
  };
}
