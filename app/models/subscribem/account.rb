module Subscribem
  class Account < ActiveRecord::Base
    validates :subdomain, presence: true, uniqueness: true
    validates_exclusion_of :subdomain, in: SubdomainValidator::EXCLUDED_SUBDOMAINS,
      message: SubdomainValidator.exclusion_failure_message
    validates_format_of :subdomain, with: SubdomainValidator::STRING_ONLY_REGEX,
      message: SubdomainValidator.invalid_failure_message
    belongs_to :owner, class_name: "Subscribem::User"
    accepts_nested_attributes_for :owner
    def subdomain_validator
      SubdomainValidator.new
    end
  end
end
