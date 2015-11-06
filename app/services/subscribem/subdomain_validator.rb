module Subscribem
  class SubdomainValidator
    EXCLUDED_SUBDOMAINS = %w(admin)
    STRING_ONLY_REGEX = /\A[\w\-]+\Z/i
    class << self
      def exclusion_failure_message
        "is not allowed, please choose another subdomain."
      end
      def invalid_failure_message
        "is not valid, please choose another subdomain."
      end
    end
  end
end
