# not executable, source from other scripts

basepath="$(realpath -- "$(dirname -- "${BASH_SOURCE[0]:-$0}")/..")"
pluginroot="$basepath/plugins"

# Build state paths
statepath="$basepath/build"
basebuilddir="$statepath/cache"

wfplug_plugin_bin_path="$statepath/install/plugins"
wfplug_plugin_xml_path="$statepath/install/xml"

if [[ ! "$WAYFIRE_PLUGIN_PATH" =~ "$wfplug_plugin_bin_path" ]]; then
    WAYFIRE_PLUGIN_PATH="$wfplug_plugin_bin_path":$WAYFIRE_PLUGIN_PATH
    WAYFIRE_PLUGIN_XML_PATH="$wfplug_plugin_xml_path":$WAYFIRE_PLUGIN_XML_PATH
fi

get_plugin_builddir() {
    echo "$basebuilddir/$1"
}
get_plugin_installlog() {
    echo "$basebuilddir/$1/wfplug_installed.txt"
}
get_plugin_installroot() {
    echo "$basebuilddir/$1/installroot"
}
