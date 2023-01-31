require "base64"
require "openssl"

module Apollo
  # Authorization
  class Auth
    class << self
      def signature(secret, timestamp, uri)
        return if secret.nil?

        sign = "#{timestamp}\\n#{uri}"
        Base64.encode64(OpenSSL::HMAC.digest("sha1", secret, sign))
      end
    end
  end
end
