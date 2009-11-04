require 'functionals/test_helper'
require 'app'

context 'The recruitment app' do
  setup { @app = Nurun::Recruitment::App }

  context '/login' do
    setup { get '/login' }
    should_respond_with(200)
  end

  context '/' do
    setup { get '/' }
    should_respond_with(200)
  end
end
