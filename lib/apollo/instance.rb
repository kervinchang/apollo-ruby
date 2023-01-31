# frozen_string_literal: true

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
      self.client = @client || Client.new(configuration)
    end

    def fetch(key, default = nil, opts = {}, &block)
      opts[:disable_cache] = false unless opts.key?(:disable_cache)
      value = client.fetch(key, opts[:disable_cache])
      value || (block_given? ? block.call(key) : default)
    end

    def [](key)
      fetch(key)
    end
  end
end
