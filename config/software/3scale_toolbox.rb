# These options are required for all software definitions
name '3scale_toolbox'
default_version '0.4.0'

dependency 'ruby'
dependency 'rubygems'
dependency 'bundler'

version '0.5.0' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
  md5: '95475ea169e618636e1d387c3ae43a87'
end

relative_path "3scale_toolbox-#{version}"

build do
  gem "install 3scale_toolbox -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}"
end
