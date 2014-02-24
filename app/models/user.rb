class User < ActiveRecord::Base
  attr_accessor :fname,:lname, :country, :birthday, :email,
                  :password,  :password_confirmation,:avatar,
                  :validated, :validation_code,
                  :emailsecret, :secretcode
  

  mount_uploader :avatar, AvatarUploader
  before_save do |user|
    require 'digest/md5'
    user.email = email.downcase
    user.username = user.email
    user.username = user.username.gsub(/(@.+)/, "")
    user.emailsecret =  Digest::MD5.hexdigest(user.email)
  end

  has_many :authorizations
end
