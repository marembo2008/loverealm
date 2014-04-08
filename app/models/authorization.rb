class Authorization < ActiveRecord::Base
  belongs_to :user
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |authorization|
      authorization.provider = auth.provider
      authorization.uid = auth.uid
      authorization.oauth_token = auth.credentials.token
      authorization.oauth_expires_at = Time.at(auth.credentials.expires_at)
      #create a user for this authorization.
      email = auth.info.email
      @user = User.new(:fname => auth.info.first_name, :lname => auth.info.last_name, :email => email)
      @user.password = auth.info.name
      @user.password_confirmation = auth.info.name
      @user.uid = auth.uid
      is_saved = false
      is_saved = @user.save
      if is_saved
      authorization.user = @user
      end
      authorization.save!
    end
  end
end
