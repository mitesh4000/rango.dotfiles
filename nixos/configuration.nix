{ config, pkgs, ... }:

{
  imports = [./hardware-configuration.nix];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

# Select internationalisation properties.
i18n.defaultLocale = "en_US.UTF-8";

i18n.extraLocaleSettings = {
  LC_ADDRESS = "en_US.UTF-8";
  LC_IDENTIFICATION = "en_US.UTF-8";
  LC_MEASUREMENT = "en_US.UTF-8";
  LC_MONETARY = "en_US.UTF-8";
  LC_NAME = "en_US.UTF-8";
  LC_NUMERIC = "en_US.UTF-8";
  LC_PAPER = "en_US.UTF-8";
  LC_TELEPHONE = "en_US.UTF-8";
  LC_TIME = "en_US.UTF-8";
};

 # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    desktopManager = {xterm.enable=false;};
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
	i3lock
	i3blocks
      ];
    };
  };


services.displayManager = {
      defaultSession = "none+i3";
    };
  #services.xserver.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  programs.dconf.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rango = {
    isNormalUser = true;
    description = "rango";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
environment.systemPackages = with pkgs; [
    #-- Essentials --
    zip
    unzip
    wget
    networkmanagerapplet
    git
    alacritty
    brightnessctl
    firefox
    curl
    fish
    fzf
    acpi
    
    #-- Dev tools ---
    xclip
    rustup
    sqlitebrowser
    postgresql
    postman
    nodejs
    
    #-- Rust packages ---
    cargo
    zellij
    bacon

    #-- window manager ----
    dmenu
    i3

    #-- Additional packages --
    ani-cli # cli anime searies surfer 
    bash-completion
    #calibre
    #dropbox
    fd
    gcc
    # gimp
    gnumake
    go
    graphite-cursors
    gscreenshot
    htop
    hugo
    jmtpfs 
    kitty
    lazygit # rust based cli git client
    lf 
    # libreoffice
    lua
    lua-language-server
    luarocks #package manager fo luarocks
    lxappearance
    # mongodb-compass
    neofetch
    neovim
    nerdfonts

    # -- building package --
    ninja # build system to reduce build time 
    pkg-config #it tells the compiler where to find header files and what libraries to link against.
    
    # obsidian
    openssl
    picom
    pulseaudio
    qbittorrent
    ripgrep
    (rofi.override { waylandSupport = true; }) # For wayland support
    thunar
    vlc
    vscodium
    yaru-theme
    yazi
    yt-dlp
    zathura

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
