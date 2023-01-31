module Apollo
  # A copy of Apollo's base module class methods.
  class Instance
    # See Apollo::Client
    attr_writer :client

    # See Apollo::Configuration
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
