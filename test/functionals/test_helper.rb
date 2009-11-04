require 'test_helper'

class Riot::Situation
  include ::Rack::Test::Methods
  def app() @app; end
end
