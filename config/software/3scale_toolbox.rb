# These options are required for all software definitions
name '3scale_toolbox'
default_version '0.4.0'

dependency 'ruby'
dependency 'rubygems'
dependency 'bundler'

# Sources may be URLs, git locations, or path locations
# Currently testing with specific patched release. Uncomment when not needed.
#source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
#       md5: "6a5b807dc1fca5959338fc04563f7d84"
#build do
#  gem "install 3scale_toolbox -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}"
#end

# only to use patched release
source url: 'https://github.com/3scale/3scale_toolbox/archive/0.4.0_patched_ssl.tar.gz',
       md5: '22eafe298a98c772481d0cda5d73b5a4'

relative_path '3scale_toolbox-0.4.0_patched_ssl'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # This installs dependencies, and creates a Gemfile.lock for use by
  # appbundler later
  bundle 'install --without development test --retry 3', env: env

  # Now, we still need to actually install 3scale_toolbox in the embedded package
  gem 'build 3scale_toolbox.gemspec', env: env
  gem 'install ./3scale_toolbox-*.gem --local --no-ri --no-rdoc', env: env

  # Now, create an 3scale binstub
  gem 'install appbundler --version 0.10.0 --no-ri --no-rdoc', env: env
  command "appbundler . '#{install_dir}/bin' 3scale_toolbox", env: env
end
