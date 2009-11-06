require 'helpers'

module Nurun
  module Recruitment
    module Configuration
      def self.included(sinatra_app)
        root_dir = File.expand_path(File.dirname(__FILE__))

        sinatra_app.class_eval {
          register Sinatra::R18n unless extensions.include?(Sinatra::R18n)

          helpers Sinatra::UrlForHelper
          helpers Sinatra::ContentFor
          helpers Nurun::Recruitment::Helpers

          configure do
            Compass.configuration { |config|
              config.environment = RACK_ENV

              config.project_path     = root_dir
              config.sass_dir         = 'views/sass'
              config.css_dir          = 'public/css'
              config.images_dir       = 'public/images'
              config.javascripts_dir  = 'public/js'

              config.http_stylesheets_path = '/css'
              config.http_images_path      = '/images'
              config.http_javascripts_path = '/js'

              if RACK_ENV == 'production'
                config.output_style = :compressed #:nested, :expanded, :compact
              else
                config.output_style = :expanded
              end

              config.sass_options = {
                :cache => (RACK_ENV == 'production'),
                :cache_location => File.join(root_dir, 'tmp/sass_cache')
              }
            }

            set :root, root_dir
            enable :static

            set :haml, { :format => :html5, :ugly => true }
            set :sass, Compass.sass_engine_options.merge(:views => 'views/sass') # shit
          end
        }
      end
    end
  end
end
