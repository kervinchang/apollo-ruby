require "logger"

module Apollo
  # Log.
  module Log
    class << self
      attr_accessor :logger

      def logger
        @logger ||= ::Logger.new($stderr)
      end
    end
  end
end
