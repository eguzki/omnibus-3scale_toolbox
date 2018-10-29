source 'https://rubygems.org'

# support extra_package_files w/macos pkg packager
# https://github.com/sensu/omnibus/commit/87df1ff6ff0ffd4d404f728ebfb1bf0493d38a54
omnibus_version = if /darwin/ =~ RUBY_PLATFORM
                    { git: 'https://github.com/sensu/omnibus.git', branch: 'sensu' }
                  else
                    '~> 6.0'
                  end
# Install omnibus
gem 'omnibus', omnibus_version

# Use Chef's software definitions. It is recommended that you write your own
# software definitions, but you can clone/fork Chef's to get you started.
gem 'omnibus-software', github: 'chef/omnibus-software'

# This development group is installed by default when you run `bundle install`,
# but if you are using Omnibus in a CI-based infrastructure, you do not need
# the Test Kitchen-based build lab. You can skip these unnecessary dependencies
# by running `bundle install --without development` to speed up build times.
group :development do
  # Use Berkshelf for resolving cookbook dependencies
  gem 'berkshelf', '~> 3.3'

  # Use Test Kitchen with Vagrant for converging the build environment
  gem 'kitchen-vagrant', '~> 0.18'
  gem 'test-kitchen',    '~> 1.4'
end
