# wfplug 

Plugin build and development tool for Wayfire, the configurable Wayland window manager.

# Dependencies

- `wayfire`
- `meson`
- `jq`

# Setup

Clone this repo

```bash
git clone https://www.github.com/timgott/wfplug
```


Change your wayfire startup script or wayfire.desktop file to run

```
/path/to/wfplug/bin/wfplug-run_with_env wayfire
```

Put the `wfplug-*` commands into your `$PATH` by running in the wfplug folder from your shell.

```bash
source activate
```


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

where `<PLUGIN>` is the name of the folder containing the plugin.


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

