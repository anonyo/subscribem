module Subscribem
  class Account < ActiveRecord::Base
    EXCLUDED_SUBDOMAINS = %w(admin)
    validates :subdomain, presence: true, uniqueness: true
    validates_exclusion_of :subdomain, in: EXCLUDED_SUBDOMAINS,
    message: "is not allowed, please choose another subdomain."
    belongs_to :owner, class_name: "Subscribem::User"
    accepts_nested_attributes_for :owner
  end
end
