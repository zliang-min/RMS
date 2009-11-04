module Nurun
  module Recruitment
    module Helpers
      def link_to(text, url, options = {})
        "<a #{hash_to_attributes({:href => url}.merge(options))}>#{text}</a>"
      end

      def javascript_include_tag(*source)
        souces.map { |js|
          js = url_for("/js/#{js}") unless remote_asset?(js)
          %Q'<script type="text/javascript" src="#{js}"></script>'
        }.join
      end

      def stylesheet_link_tag(*source)
        options = source.last.is_a?(Hash) ? source.pop : {}
        options = {:media => "screen", :rel => "stylesheet", :type => "text/css"}.merge(options)
        source.map { |css|
          css = url_for("/css/#{css}.css") unless remote_asset?(css)
          %Q'<link href="#{css}" #{hash_to_attributes(options)}'
        }.join
      end

      private
        def remote_asset?(url)
          url =~ %r'^\w+://.+'
        end

        def hash_to_attributes(options)
          options.map { |k, v| %'#{k} = "#{v}"' }.join(' ')
        end
    end
  end
end
