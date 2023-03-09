# wfplug :electric_plug::fire:

Plugin manager for Wayfire, the extendable Wayland window manager.

It makes it easy to install plugins, and test them with isolated config. It also can setup a new plugin quickly from a template.

Works with any project that contains a wayfire plugin and uses meson.

## Dependencies

- `wayfire`
- `meson`
- `jq`

## Setup

Clone this repo:

```bash
git clone https://www.github.com/timgott/wfplug
```

## Basic Usage

### Enabling wplug

To use `wfplug-*` commands run from your shell (with your wfplug path):

```bash
source ~/wfplug/activate
```

### Installing a plugin

```bash
wfplug-goto-plugins
git clone ...
```

Compile and install with:

```
wfplug-build <PLUGIN>
```

where `<PLUGIN>` is the name of the subfolder containing the plugin. It is installed in the build/install/ folder, your system root is not touched.

### Clean up plugin

To uninstall and delete build files:

```
wfplug-clean <PLUGIN>
```

Delete the entire build/ folder to clean up all build state and installations.

You have to manually remove the plugin from the plugins/ folder.


### Running wayfire with plugins

Start wayfire with the following command to use plugins installed in wfplug:

```bash
/path/to/wfplug/bin/wfplug-run_with_env wayfire
```

Modify your startup script or .desktop file accordingly. For example, you can put the following file into `/usr/local/share/wayland-sessions/wayfire-wfplug.desktop`:

```
[Desktop Entry]
Version=0.8
Name=Wayfire (wfplug)
Comment=Use this session to run Wayfire with wfplug plugins
Exec=/INSERT_PATH_HERE/wfplug/bin/wfplug-run_with_env wayfire
Type=Application
```

See also `wfplug-test` to run a plugin in isolation.


### Creating a new plugin

```
wfplug-new <NAME>
```

The generated plugin is empty but ready to compile and install with `wfplug-compile`, as well as for testing with `wfplug-test`. You can get started on the code without further setup. See existing plugins and wayfire docs if you want to learn how to write a plugin.


### Testing a plugin

```
wfplug-test <PLUGIN>
```

It compiles the plugin and generates a config automatically from the default plugin template if the plugin does not ship one. You can add custom configs (see `wfplug-test --help`).
