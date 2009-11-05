require 'machinist/active_record'
require 'sham'

Dir[File.join(File.dirname(__FILE__), 'blueprints/**/*.rb')].each { |bp|
  require bp
}
