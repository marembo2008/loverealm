class Credential < ActiveRecord::Base
 attr_accessor :email, :password, :oAuthID, :oAuthType
 
 belongs_to :profile
 
 validates :oAuthID, presence: true, uniqueness: {case_sensitive: false}, if: :oauth_credential?
 validates :oAuthType, presence: true, inclusion: {in: %w{facebook google twitter linkedin}, message: "%{value} login option is not currently supp    orted"}, if: :oauth_credentials?

 validates :email, presence: true, confirmation: true, uniqueness: {case_sensitive: false}, unless: :oauth_credential?
 validates :password, presence: true, format: {with: /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/, message: "must be at least 6 characters and include one number and one letter."}, unless: :oauth_credential?
 validates :confirm_password, presence: true, unless: :oauth_credential?
 has_secure_password

 def oauth_credential?
  email.nil?
 end

end
