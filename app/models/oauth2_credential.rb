class OAuth2Credential < AbstractCredential
 attr_access :oAuthID, :oAuthType
 validates :oAuthID, presence: true, uniqueness: {case_sensitive: false}
 validates :oAuthType, presence: true, inclusion: {in: %w{facebook google twitter linkedin}, message: "%{value} login option is not currently supported"}
end
