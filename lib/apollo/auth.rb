require "base64"
require "openssl"

module Apollo
  # Authorization
  class Auth
    class << self
      def signature(secret, timestamp, path_with_query)
        return if secret.nil?

        sign = "#{timestamp}\n#{path_with_query}"
        Base64.encode64(OpenSSL::HMAC.digest("sha1", secret, sign))
      end
    end
  end
end
