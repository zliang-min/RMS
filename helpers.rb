module Nurun
  module Recruitment
    module Helpers
      def link_to(text, url, options = {})
        "<a #{hash_to_attributes({:href => url}.merge(options))}>#{text}</a>"
      end

      def javascript_include_tag(*source)
        source.map { |js|
          js = url_for("/js/#{js}.js") unless remote_asset?(js)
          %Q'<script type="text/javascript" src="#{js}"></script>'
        }.join
      end

      def stylesheet_link_tag(*source)
        options = source.last.is_a?(Hash) ? source.pop : {}
        options = {:media => "screen", :rel => "stylesheet", :type => "text/css"}.merge(options)
        source.map { |css|
          css = url_for("/css/#{css}.css") unless remote_asset?(css)
          %Q'<link href="#{css}" #{hash_to_attributes(options)}>'
        }.join
      end

      def sidebar_box title, content
        haml <<_HAML_, :locals => {:title => title, :content => content}, :layout => false
%li
  %h2= title
  - if content.respond_to?(:to_str)
    %p= content.to_str
  - else
    %ul
      - empty_h = {}.freeze
      - content.each do |text, link, options|
        %li
          = link_to text, link, options || empty_h
_HAML_
      end

      def sidebar boxes
        content_for :sidebar do
          haml <<_HAML_, :locals => {:boxes => boxes}, :layout => false
%ul
  - boxes.each do |title, content|
    = sidebar_box title, content
_HAML_
        end
      end

      def include_google_jsapi packages
        callback = packages.delete(:callback) || 'onLoadCallback'
        scripts = %Q'<script type="text/javascript" src="http://www.google.com/jsapi"></script>\n'
        scripts << %Q'<script type="text/javascript">\n'
        scripts << "//<![CDATA[\n"
        scripts << packages.map do |p, o|
          o = {:version => o} unless o.respond_to?(:keys)
          version = o.delete :version
          
          if o.blank?
            "google.load('#{p}', '#{version}');"
          else
            "google.load('#{p}', '#{version}', #{o.to_json});"
          end
        end.join

        scripts << "google.setOnLoadCallback(#{callback});\n"
        scripts << "//]]>\n</script>"
      end

      def link_jqueryui_css(theme = 'base')
        stylesheet_link_tag "http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/#{theme}/jquery-ui.css", :media => 'screen'
      end

      private
        def remote_asset?(url)
          url =~ %r'^\w+://.+'
        end

        def hash_to_attributes(options)
          options.map { |k, v| %'#{k}="#{v}"' }.join(' ')
        end
    end
  end
end
