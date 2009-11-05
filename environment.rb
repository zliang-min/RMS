# Setup the environment for the application.

# Rack environment
RACK_ENV = ENV['RACK_ENV'] or 'development' unless defined?(RACK_ENV)

root_dir = File.expand_path(File.dirname(__FILE__))

# Load dependencies
require File.join(root_dir, 'vendor/gems/environment')
Bundler.require_env RACK_ENV

# Setup loas path
$LOAD_PATH[0, 0] = %w[. models lib].map { |d| File.join(root_dir, d) }

# Encoding
# Rack need its input is ASCII-8BIT encoded
Encoding.default_external = Encoding::ASCII_8BIT if defined?(Encoding)

# Load libraries
Dir[root_dir + '/lib/*.rb'].each { |lib| require lib }

# Connect DB
if RACK_ENV == 'test'
  DataMapper.setup :default, 'sqlite3::memory:'
else
  DataMapper.setup(:default, {
    :adapter  => 'mysql',
    :encoding => 'UTF-8',
    :soket    => '/tmp/mysql.sock',
    :database => "recruitment_#{RACK_ENV}",
    :username => 'root',
    :password => nil
  })
end

# Load models
Dir[root_dir + '/models/**/*.rb'].each { |m| require m }
