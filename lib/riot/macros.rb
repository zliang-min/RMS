module Nurun
  module Riot
    module Macros
      def should_respond_with(status)
        should("respond with status #{status}") {
          last_response.status
        }.equals(status)
      end
    end
  end
end

Riot::Context.class_eval { include Nurun::Riot::Macros }
