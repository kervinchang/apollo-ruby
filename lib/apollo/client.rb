# frozen_string_literal: true

module Apollo
  # Get configuration data from Apollo server.
  class Client
    attr_accessor :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def fetch(key, disable_cache)
      return nil if [configuration.server, configuration.appid, configuration.secret].any?(&:nil?)

      disable_cache ? uncached_http_get(key) : cached_http_get(key)
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
      url = "#{configuration.server}/configs/#{configuration.appid}/#{configuration.cluster}/#{configuration.namespace}"
      headers = build_http_headers(url)
      code, data, _headers = HTTP.get(url, headers)
      return unless HTTP.response_ok?(code)

      configurations = Utils.safe_json_parse(data)["configurations"]
      configurations[key]
    end

    def build_http_headers(url)
      timestamp = Time.now.utc.strftime("%s%L")
      uri = Utils.safe_uri_parse(url)
      path_with_query = uri.path
      path_with_query += "?#{uri.query}" unless uri.query.nil?
      signature = Auth.signature(configuration.secret, timestamp, path_with_query)
      {
        "Authorization" => "Apollo #{configuration.appid}:#{signature}",
        "Timestamp" => timestamp
      }
    end
  end
end
