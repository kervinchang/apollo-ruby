require "apollo/auth"
require "apollo/client"
require "apollo/configuration"
require "apollo/http"
require "apollo/instance"
require "apollo/log"
require "apollo/utils"
require "apollo/version"

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
