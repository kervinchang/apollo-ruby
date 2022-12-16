require "json"

module Apollo
  # Utils.
  module Utils
    class << self
      def safe_json_parse(data)
        JSON.parse(data)
      rescue JSON::ParserError
        {}
      end
    end
  end
end
