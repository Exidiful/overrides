# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [
        "ahci"
        "xhci_pci"
        "virtio_pci"
        "sr_mod"
        "virtio_blk"
      ];
      kernelModules = [ ];
      luks.devices."luks-d719ccb3-3478-4b82-a67a-c9e1286a727c".device = "/dev/disk/by-uuid/d719ccb3-3478-4b82-a67a-c9e1286a727c";
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/3f4f21b1-b153-4911-bf8a-ce262b602a01";
    fsType = "ext4";
  };
  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
