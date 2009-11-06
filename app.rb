# @autor Gimi Liang <gimi.liang@nurun.com>

module Nurun
  module Recruitment
    autoload :Configuration, File.expand_path('configuration', File.dirname(__FILE__))

    class App < Sinatra::Base

      include Configuration

      before do
        session[:locale] = params[:locale] or options.default_locale
      end

      helpers do
      end

      # assets paths
      get '/css/*.css' do |css_file|
        content_type 'text/css', :charset => 'UTF-8'
        sass css_file.to_sym
      end
      # end

      get '/login' do
        "Hello World"
      end

      get '/' do
        haml :index
      end

      # positions/index
      get '/positions' do
        @positions = Position.all
        haml :'positions/index'
      end

      # positions/create
      #post %r'^/positions(?:\.(*))?/?$' do |format|
      post '/positions.json' do
        content_type 'application/json', :charset => 'UTF-8'
        params.nest!
        position = Position.new(params[:position])
        if position.save
          position.to_json
        else
          halt 400, position.errors.to_has.to_json
        end
      end

      # category/create
      #post %r'^/categories(?:\.(.*))?/?$' do |format|
      post '/categories.json' do
        content_type 'application/json', :charset => 'UTF-8'
        params.nest!
        category = Category.new(params[:category])
        if category.save
          category.to_json
        else
          halt 400, category.errors.to_hash.to_json
        end
      end

=begin
      # It's very inconvenient when method and format are separated.
      # Give up.
      mount Position

      mount Category do
        formats[:json] = proc { |data|
          puts "new record? #{data.new_record?}"
          if data.new_record?
            halt 400
          else
            data.to_json
          end
        }
      end
=end

    end # App
  end # Recruitment
end # Nurun
