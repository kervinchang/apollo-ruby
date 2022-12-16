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
      code, data, _headers = HTTP.get(url)
      return unless HTTP.response_ok?(code)

      configurations = Utils.safe_json_parse(data)
      configurations[key]
    end

    def uncached_http_get(key)
      url = "#{configuration.server}/configs/json/#{configuration.appid}/#{configuration.cluster}/#{configuration.namespace}"
      code, data, _headers = HTTP.get(url)
      return unless HTTP.response_ok?(code)

      configurations = Utils.safe_json_parse(data)["configurations"]
      configurations[key]
    end
  end
end
