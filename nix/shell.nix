{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = [
    pkgs.pkg-config pkgs.meson pkgs.ninja pkgs.cmake pkgs.jq pkgs.wayland pkgs.libevdev
    pkgs.librsvg
    pkgs.glibmm
    pkgs.wayfire
    pkgs.gdbHostCpuOnly
    pkgs.clang-tools
    pkgs.boost # for Firedecor
  ];
  inputsFrom = [
    pkgs.wayfire
  ];
  shellHook = ''
    source "${builtins.toString ../activate}"
    wfplug-goto-plugins
  '';
}
