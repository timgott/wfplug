# not executable, source from other scripts

basepath="$(realpath --no-symlinks "$(dirname "${BASH_SOURCE[0]}")/..")"
pluginroot="$basepath/plugins"

# Build state paths
statepath="$basepath/build"
basebuilddir="$statepath/cache"

installdestdir="$statepath/out"
installprefix="/usr" # will be put inside installdestdir
