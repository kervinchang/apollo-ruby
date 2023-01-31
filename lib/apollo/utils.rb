require "json"
require "uri"

module Apollo
  # Utils.
  module Utils
    class << self
      def safe_json_parse(data)
        JSON.parse(data)
      rescue JSON::ParserError
        {}
      end

      def safe_uri_parse(url)
        URI.parse(url)
      rescue URI::InvalidURIError
        ""
      end
    end
  end
end
