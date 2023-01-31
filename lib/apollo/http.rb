require "rest-client"

module Apollo
  # HTTP Client.
  module HTTP
    class << self
      def response_ok?(status_code)
        [200, 304].include?(status_code)
      end

      def get(url, headers, _opts = {})
        response = RestClient.get(url, headers)
        [response.code.to_i, response.body, response.raw_headers]
      rescue StandardError => e
        Log.logger.warn "#{e.message} => Apollor::HTTP.get('#{url}')"
        if e.respond_to?(:response) && e.response.respond_to?(:code)
          return e.response.code, e.response.body, e.response.raw_headers
        end

        [nil, nil, nil]
      end
    end
  end
end

