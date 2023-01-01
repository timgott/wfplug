# wfplug :electric_plug::fire:

Plugin build and development tool for Wayfire, the extendable Wayland window manager.

It makes it very easy to create new plugins, build plugins and try them with isolated config.

# Dependencies

- `wayfire`
- `meson`
- `jq`

# Setup

Clone this repo:

```bash
git clone https://www.github.com/timgott/wfplug
```

### Enabling wplug commands

To use `wfplug-*` commands run from your shell in the wfplug folder:

```bash
source activate
```

This will put the wfplug bin folder into your `$PATH`.

### Running wayfire with wfplug

Start wayfire with the following command to use plugins installed in wfplug:

```bash
/path/to/wfplug/bin/wfplug-run_with_env wayfire
```

Modify your startup script or .desktop file accordingly.


# Basic Usage

The following requires that you have added the commands to your `$PATH` as described above.


## Installing a plugin

Put the Wayfire plugin into a subfolder of the plugins/ folder (e.g. fetch it with `git clone`)

```bash
cd plugins
git clone ...
```

Compile and install with:

```
wfplug-compile <PLUGIN>
```

where `<PLUGIN>` is the name of the folder containing the plugin. It is installed into the build/out folder in the wfplug directory, your system root is not touched.

Uninstall and clean with

```
wfplug-erase <PLUGIN>
```

Delete the entire build/ folder to clean up all build state and installations.



## Creating a new plugin

```
wfplug-new <NAME>
```

The generated plugin is empty but ready to compile and install with `wfplug-compile`, as well as for testing with `wfplug-test`. You can get started on the code without further setup. See existing plugins and wayfire docs if you want to learn how to write a plugin.


## Testing a plugin

```
wfplug-test <PLUGIN>
```

It compiles the plugin and generates a config automatically from the default plugin template if the plugin does not ship one. You can add custom configs (see `wfplug-test --help`).
