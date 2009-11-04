# @autor Gimi Liang <gimi.liang@nurun.com>

module Nurun
  module Recruitment
    autoload :Configuration, File.expand_path('configuration', File.dirname(__FILE__))

    class App < Sinatra::Base

      include Configuration

      before do
        session[:locale] = params[:locale] or options.default_locale
      end

      # assets paths
      get '/css/*.css' do |css_file|
        content_type 'text/css', :charset => 'utf-8'
        sass css_file.to_sym
      end
      # end

      get '/login' do
        "Hello World"
      end

      get '/' do
        haml :index
      end
    end # App
  end # Recruitment
end # Nurun
