class User < ActiveRecord::Base
  attr_accessor :fname,:lname, :country, :birthday, :email,
                  :password,  :password_confirmation,:avatar,
                  :validated, :validation_code,
                  :emailsecret, :secretcode
  

  #mount_uploader :avatar, AvatarUploader
  before_save do |user|
    require 'digest/md5'
    user.email = email.downcase
    user.emailsecret =  Digest::MD5.hexdigest(user.email)
  end

  has_many :authorizations

  has_many :posts, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :followed_users, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id",
    :class_name => "Relationship",
    :dependent => :destroy
  has_many :followers, :through => :reverse_relationships , :source => :follower

  has_many :articlelikes, :foreign_key => "user_id", :dependent => :destroy

  has_many :notifications, :foreign_key => "user_id", :dependent => :destroy, :order => 'updated_at DESC'
 
def my_articles
Post.find_by_user_id(self)
end

def feed
   Post.from_users_followed_by(self)
end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

def like(article_id)    
      likearticle.create(:article_id => article_id, :user_id => self)
  end

def follow!(other_user)
    relationships.create!(:followed_id => other_user.id)
  end

  def unfollow(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end


end
