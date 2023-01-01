# wfplug 

Plugin build and development tool for Wayfire, the configurable Wayland window manager.

# Dependencies

- `wayfire`
- `meson`
- `jq`

# Setup

Clone this repo:

```bash
git clone https://www.github.com/timgott/wfplug
```

## Using wfplug plugins in wayfire

Run wayfire with the following command to use plugins installed in wfplug:

```
/path/to/wfplug/bin/wfplug-run_with_env wayfire
```

Modify your startup script or .desktop file accordingly.

## Using wplug commands

To use `wfplug-*` commands run from your shell in the wfplug folder:

```bash
source activate
```

This will put the wfplug bin folder into your `$PATH`.


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

## Testing a plugin

```
wfplug-test <PLUGIN>
```

It compiles the plugin and generates a config automatically from the default plugin template if the plugin does not ship one. You can add custom configs (see `wfplug-test --help`).


## Creating a new plugin

```
wfplug-new <NAME>
```

The generated plugin is empty but ready to compile and install with `wfplug-compile`, as well as for testing with `wfplug-test`.

