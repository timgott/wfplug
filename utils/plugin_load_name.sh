#!/usr/bin/env sh

# finds the name of plugin library file that has been installed

set -e

# find $basepath, $pluginroot, $statepath, $basebuilddir, $installdestdir, $installprefix
source "$(dirname "$0")/../bin/paths.sh"

plugin_dir_name="$1"

targets_data="$basebuilddir/$plugin_dir_name/meson-info/intro-targets.json"
if [[ ! -e "$targets_data" ]]; then
    echo "Plugin $1 not installed. Try: wfplug-compile $1"
    exit 1
fi

# output target name
jq -r '.[0]["name"]' $targets_data
