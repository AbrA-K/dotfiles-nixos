{config, pkgs, ...} :
{
  services.xserver.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
  tangram
  gnomeExtensions.caffeine
  eartag
  amberol
  dialect
  rnote
  authenticator
  eyedropper
  graphs
  khronos
  gnome-obfuscate
  gnome-solanum
  video-trimmer
  ];

  services.flatpak.enable = true;
}
