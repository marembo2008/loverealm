class Authorization < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |authorization|
      authorization.provider = auth.provider
      authorization.uid = auth.uid
      authorization.oauth_token = auth.credentials.token
      authorization.oauth_expires_at = Time.at(auth.credentials.expires_at)
      #create a user for this authorization.
      dummy_email = "everyone@dummy.com"
      @user = User.new(:fname => auth.info.name, :email => dummy_email)
      is_saved = false
      is_saved = @user.save
      if is_saved
        puts "New user created #{@user.id}"
      authorization.uid = @user.id
      end

      authorization.save!
    end
  end
end
