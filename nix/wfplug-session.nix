{ wayfire, lib, ninja, stdenv, pkg-config, meson, libxkbcommon, symlinkJoin, libevdev,
  glibmm, wayland-protocols, xcbutilwm, librsvg, gdk-pixbuf, udev, libinput,
  writeTextFile, writeShellScript, dbus }:
let
  # base dir containing plugins
  pluginsRoot = ../plugins;

  # names of subdirectories of pluginsRoot
  pluginNames = builtins.attrNames (lib.filterAttrs (name: type: type == "directory") (builtins.readDir pluginsRoot));

  # plugin XML metadata installation folder
  metadatadir = "share/wayfire/metadata";

  # plugin .so installation folder
  plugindir = "lib/wayfire";

  # build plugin given name
  makePlugin = name: stdenv.mkDerivation {
    name = name;
    buildInputs = [
      pkg-config meson ninja
      wayfire
      # not correctly propagated wayfire deps
      # pkgs.wayland pkgs.wlroots pkgs.cairo pkgs.pango
      libxkbcommon xcbutilwm
      # plugin dependencies
      libevdev glibmm wayland-protocols librsvg gdk-pixbuf udev libinput
    ];
    src = lib.cleanSource (pluginsRoot + "/${name}");
    PKG_CONFIG_WAYFIRE_PLUGINDIR = plugindir;
    PKG_CONFIG_WAYFIRE_METADATADIR = metadatadir;
    dontStrip = true;
  };

  # build set of plugins
  plugins = map makePlugin pluginNames;

  # wrap wayfire with plugin paths
  appendSuffix = suffix: p: p + "/${suffix}";
  buildPathString = suffix: lib.escapeShellArg (lib.concatMapStringsSep ":" (appendSuffix suffix) plugins);
  pluginPath = buildPathString plugindir;
  metadataPath = buildPathString metadatadir;

  wayfireWrapped = writeShellScript "wayfire-wfplug"
    ''
      set -o errexit
      if [ ! "$_WFPLUG_WRAPPER_ALREADY_EXECUTED" ]; then
        export XDG_CURRENT_DESKTOP=sway
        export WAYFIRE_PLUGIN_XML_PATH=${metadataPath}
        export WAYFIRE_PLUGIN_PATH=${pluginPath}
        export _WFPLUG_WRAPPER_ALREADY_EXECUTED=1
      fi
      if [ "$DBUS_SESSION_BUS_ADDRESS" ]; then
        export DBUS_SESSION_BUS_ADDRESS
        exec ${wayfire}/bin/wayfire "$@"
      else
        exec ${dbus}/bin/dbus-run-session ${wayfire}/bin/wayfire "$@"
      fi
    '';

  # create desktop file
  desktopFile = writeTextFile {
    name = "wfplug-session";
    text = ''
      [Desktop Entry]
      Version=0.8
      Name=Wayfire (wfplug)
      Comment=Use this session to run Wayfire with wfplug plugins
      Exec=${wayfireWrapped}
      Type=Application
    '';
    destination = "/share/wayland-sessions/wfplug.desktop";
  };
in
  desktopFile // { providedSessions = [ "wfplug" ]; }
