class Authorization < ActiveRecord::Base

def self.from_omniauth(auth)
where(auth.slice(:provider, :uid)).first_or_initialize.tap do |authorization|
      authorization.provider = auth.provider
      authorization.uid = auth.uid
      authorization.name = auth.info.name
      authorization.oauth_token = auth.credentials.token
      authorization.oauth_expires_at = Time.at(auth.credentials.expires_at)
      authorization.save!
end

end
