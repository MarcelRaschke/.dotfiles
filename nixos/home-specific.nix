# On my home pc, symbolic link this file with `specific.nix`.
{ config, lib, pkgs, ... }:

{
  # -------------------------------------------------- Hardware configuration

  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e851ac1e-62a9-4b42-9f5a-2b1770c8a68d";
      fsType = "ext4";
    };

  fileSystems."/tmp" =
    { device = "tmpfs";
      fsType = "tmpfs";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/255ee711-493c-45ff-b30e-62b917043345";
      fsType = "ext4";
    };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 16;

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  # -------------------------------------------------- System configuration

  # Define your hostname.
  networking.hostName = "home-rfish";

  environment.systemPackages = with pkgs; [
    bluez
  ];

  # Bluetooth:
  # - Install bluez5
  # - Use bluetoothctl to pair and trust the keyboard
  # - Add udev rule to have the device active after reboot
  # See wiki.archlinux.org/index.php?title=Bluetooth&oldid=390632
  # See nixos.org/w/index.php?title=FAQ&oldid=24648#How_to_add_a_custom_udev_rule_in_nixos.3F
  hardware.bluetooth.enable = true;
  services.udev.extraRules = ''
      # Set bluetooth power up
      ACTION=="add", KERNEL=="hci0", RUN+="${config.system.path}/bin/hciconfig hci0 up"
    '';
  systemd.services."bluetooth-auto-power@" = {
    # description = "Automatically power on bluetooth device after suspend/resume-cycle";

    unitConfig = {
      Description = "Bluetooth auto power on";
      After = "bluetooth.service sys-subsystem-bluetooth-devices-%i.device suspend.target";
    };

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${config.system.path}/bin/hciconfig %i up";
    };

    wantedBy = [ "suspend.target" ];
  };

  services.xserver = {
    videoDrivers = [ "nvidia" ];

    # I use a french mac bluetooth keyboard. Pass the following line
    # if you want to swap alt key and command key
    # `echo options hid_apple swap_opt_cmd=1 | sudo tee -a /etc/modprobe.d/hid_apple.conf`
    # Maybe you should set it with `boot.extraModprobeConfig`
    # See wiki.archlinux.org/index.php?title=Apple_Keyboard&oldid=387451
    xkbModel = "apple_laptop";

    displayManager.sessionCommands = ''
      ${pkgs.feh}/bin/feh --bg-fill '/home/rfish/Sync/Pictures/c38Xn.jpg'
    '';
  };

}