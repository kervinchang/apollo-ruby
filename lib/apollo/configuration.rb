module Apollo
  # Set Apollo application configuration.
  class Configuration

    # Cluster name of Apollo application.
    attr_reader :cluster

    # Namespace name of Apollo application.
    attr_reader :namespace

    # Apollo application ID.
    attr_reader :appid

    # Apollo application secret.
    attr_reader :secret

    # Apollo server url.
    attr_reader :server

    def initialize
      self.cluster = "default"
      self.namespace = "application"
      self.appid = ENV["APOLLO_APPID"]
      self.secret = ENV["APOLLO_SECRET"]
      self.server = ENV["APOLLO_SERVER"]
    end

    def cluster=(value)
      return if value.nil?

      @cluster = value.to_s
    end

    alias cluster_name= cluster=

    def namespace=(value)
      return if value.nil?

      @namespace = value.to_s
    end

    alias namespace_name= namespace=

    def appid=(value)
      return if value.nil?

      @appid = value.to_s
    end

    alias app_id= appid=

    def secret=(value)
      return if value.nil?

      @secret = value.to_s
    end

    def server=(value)
      return if value.nil?

      @server = value.to_s
    end

    alias dsn= server=
  end
end
