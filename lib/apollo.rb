require "apollo/version"
require "apollo/instance"
require "apollo/configuration"
require "apollo/http"
require "apollo/utils"
require "apollo/client"
require "apollo/log"

# A module encapsulating Apollo server API.
module Apollo
  class << self
    extend Forwardable

    def instance
      @instance ||= Apollo::Instance.new
    end

    def_delegators :instance, :client=, :configuration=, :configuration, :client, :configure, :fetch
  end
end
