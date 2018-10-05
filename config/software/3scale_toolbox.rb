# These options are required for all software definitions
name "3scale_toolbox"
default_version "0.4.0"

dependency "ruby"
dependency "rubygems"

# Sources may be URLs, git locations, or path locations
# Currently testing with specific patched release. Uncomment when not needed.
#source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
#       md5: "6a5b807dc1fca5959338fc04563f7d84"
#build do
#  gem "install 3scale_toolbox -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}"
#end

# only to use patched release
source url: "https://github.com/3scale/3scale_toolbox/archive/0.4.0_patched_ssl.tar.gz",
       md5: "22eafe298a98c772481d0cda5d73b5a4"
relative_path "3scale_toolbox-0.4.0_patched_ssl"
build do
  # vendor the gems required by the app
  bundle "install --path vendor/bundle"
  bundle "binstubs 3scale_toolbox --path #{install_dir}/bin"
end
