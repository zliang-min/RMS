clear_sources
# bundle_path "vendor/gems"

source "http://gemcutter.org"
source "http://gems.github.com"

disable_rubygems # cool


gem 'rack', '~> 1.0.1'
gem 'rack-test', :require_as => 'rack/test'

gem 'compass', '~> 0.8.17'

gem 'sinatra', '~> 0.9.4', :require_as => 'sinatra/base'
gem 'sinatra-r18n', :require_as => 'sinatra/r18n'
gem 'emk-sinatra-url-for', :require_as => 'sinatra/url_for'
gem 'sinatra-content-for', :require_as => 'sinatra/content_for'
gem 'metaid' # needed by sinatra-hat
gem 'sinatras-hat', '0.1.2', :vendored_at => 'vendor/sinatras-hat-0.1.2'

gem 'do_mysql', :except => :test
gem 'dm-core', '~> 0.10.1'
gem 'dm-is-state_machine', '~> 0.10.1'
gem 'dm-validations', '~> 0.10.1'
#gem 'state_machine', '~> 0.8.0'

gem 'haml', '~> 2.2.10'

only :test do
  gem 'do_sqlite3'
  gem 'riot', '~> 0.9.12'
  gem 'machinist', '~> 1.0.5', :require_as => 'machinist/data_mapper'
end

bin_path "script"
