class User < ActiveRecord::Base
  validates :email, :uniqueness => {:case_sensitive => false}
  has_secure_password
  #mount_uploader :avatar, AvatarUploader
  before_save do |user|
  #   require 'digest/md5'
    user.email = email.downcase
  # user.emailsecret =  Digest::MD5.hexdigest(user.email)
  end

  has_many :authorizations

  has_many :posts, :foreign_key => "user_id", :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :followed_users, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id",
    :class_name => "Relationship",
    :dependent => :destroy
  has_many :followers, :through => :reverse_relationships , :source => :follower

  has_many :articlelikes, :foreign_key => "user_id", :dependent => :destroy

  has_many :notifications, ->{order(updated_at: :desc)}, :foreign_key => "user_id", :dependent => :destroy

  has_many :status_updates, -> {order(updated_at: :desc)}, :dependent => :destroy, :foreign_key => "uid"

  has_many :inbox_messages, ->{order(updated_at: :desc)}, :foreign_key => "recipient_id", :class_name => "UserMessage"
  has_many :outbox_messages, -> {order(updated_at: :desc)} , :foreign_key => "sender_id", :class_name => "UserMessage"

  def lovescore
    @score_from_followers = 0
    @score = 0

  end

  def my_articles
    Post.find_by_user_id(self)
  end

  def feed
    Post.from_users_followed_by(self)
  end

  def  update_status(new_status_description)
    @user = current_user
    @status = status_update.create(:description => new_status_description, :uid => @user.id)
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

  def fullname
    @name = '';
    @name = self.lname if self.lname
    @name = @name+' '+self.fname if self.fname
    @name = self.email if @name.empty?
    puts "#{@name}"
    @name
  end

end
