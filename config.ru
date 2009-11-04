%w[environment app].each { |f| require ::File.join(::File.dirname(__FILE__), f) }

use Rack::CommonLogger, STDERR
unless RACK_ENV == 'production'
  use Rack::ShowExceptions
  use Rack::Lint
end
run Nurun::Recruitment::App.new
