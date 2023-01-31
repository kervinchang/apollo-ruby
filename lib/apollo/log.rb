require "logger"

module Apollo
  # Log.
  module Log
    class << self
      def logger
        @logger ||= ::Logger.new($stderr)
      end
    end
  end
end
