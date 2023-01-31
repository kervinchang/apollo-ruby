require "cgi"
require "openssl"
require "base64"

module Apollo
  # Get configuration data from Apollo server.
  class Client

    attr_accessor :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def fetch(key, disable_cache)
      if disable_cache
        uncached_http_get(key)
      else
        cached_http_get(key)
      end
    end

    def cached_http_get(key)
      url = "#{configuration.server}/configfiles/json/#{configuration.appid}/#{configuration.cluster}/#{configuration.namespace}"
      headers = build_http_headers(url)
      code, data, _headers = HTTP.get(url, headers)
      return unless HTTP.response_ok?(code)

      configurations = Utils.safe_json_parse(data)
      configurations[key]
    end

    def uncached_http_get(key)
      url = "#{configuration.server}/configs/json/#{configuration.appid}/#{configuration.cluster}/#{configuration.namespace}"
      headers = build_http_headers(url)
      code, data, _headers = HTTP.get(url, headers)
      return unless HTTP.response_ok?(code)

      configurations = Utils.safe_json_parse(data)["configurations"]
      configurations[key]
    end

    def build_http_headers(url)
      timestamp = Time.now.strftime("%s%L")
      uri = CGI.escape(url)
      {
        authorization: "Apollo #{configuration.appid}:#{signature(timestamp, uri, configuration.secret)}",
        timestamp: timestamp
      }
    end

    def signature(timestamp, uri, secret)
      return if secret.nil?

      sign = "#{timestamp}\\n#{uri}"
      Base64.encode64(OpenSSL::HMAC.digest("sha1", secret, sign))
    end
  end
end
