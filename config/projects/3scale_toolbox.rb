#
# Copyright 2018 YOUR NAME
#
# All Rights Reserved.
#

name "3scale_toolbox"
maintainer "Eguzki Astiz Lezaun"
homepage "https://github.com/3scale/3scale_toolbox"

# Defaults to C:/3scale_toolbox on Windows
# and /opt/3scale_toolbox on all other platforms
install_dir "#{default_root}/#{name}"

build_version "0.4.0"
build_iteration 1

# Creates required build directories
dependency "preparation"

dependency "3scale_toolbox"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
exclude "**/vendor"
