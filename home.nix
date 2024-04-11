{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "abra";
  home.homeDirectory = "/home/abra";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.kakoune
  ];
  services.syncthing.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  gtk = {
    enable = true;
    # icon theme is Morewaita and needs to be installed manually, since I'm bad at nix:
    # $git clone https://github.com/somepaulo/MoreWaita.git
    # $cd MoreWaita
    # $./install.sh

    iconTheme = {
      name = "MoreWaita";
    };

    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=0
      '';
    };
  };
}
