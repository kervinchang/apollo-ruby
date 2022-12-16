module Apollo
  # A copy of Apollor's base module class methods.
  class Instance
    # See Apollor::Client
    attr_writer :client

    # See Apollor::Configuration
    attr_accessor :configuration

    def initialize(config = nil)
      self.configuration = config || Configuration.new
    end

    def client
      @client ||= Client.new(configuration)
    end

    def configure
      yield(configuration) if block_given?
      self.client = Client.new(configuration)
      client
    end

    def fetch(key, opts = {})
      opts[:disable_cache] = false unless opts.key?(:disable_cache)
      client.fetch(key, opts[:disable_cache])
    end
  end
end
