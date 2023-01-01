#!/usr/bin/env sh

# finds the name of all plugin library files that have been installed

set -e

# find $basepath, $pluginroot, $statepath, $basebuilddir, $installdestdir, $installprefix
source "$(dirname "$0")/../bin/paths.sh"

plugin_dir_name="$1"

targets_data="$basebuilddir/$plugin_dir_name/meson-info/intro-targets.json"
if [[ ! -e "$targets_data" ]]; then
    echo "Plugin $1 not installed. Try: wfplug-compile $1"
    exit 1
fi

# get target name for installed targets (these could be something other than plugins though)
names=($(jq -r '.[] | select(.installed and .type == "shared module").name' "$targets_data"))
if [[ ${#names[*]} -lt 1 ]]; then
    >&2 echo No plugin target found in $targets_data
    exit 2
fi
echo ${names[*]}
