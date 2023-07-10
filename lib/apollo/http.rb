# frozen_string_literal: true

require "net/http"

module Apollo
  # HTTP Client.
  module HTTP
    class << self
      def response_ok?(status_code)
        [200, 304].include?(status_code)
      end

      def get(url, headers, _opts = {})
        uri = URI(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        request = Net::HTTP::Get.new(uri)
        headers.each { |key, value| request[key] = value }

        response = http.request(request)
        [response.code.to_i, response.body, response.to_hash]
      rescue StandardError => e
        Apollo.logger.warn "#{e.message} => Apollo::HTTP.get('#{url}')"
        if e.respond_to?(:response) && e.response.respond_to?(:code)
          return e.response.code.to_i, e.response.body, e.response.to_hash
        end

        [nil, nil, nil]
      end
    end
  end
end
