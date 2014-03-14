class Post < ActiveRecord::Base
  attr_accessor :title, :image, :subtitle, :content, :is_draft, :url
  belongs_to :user
  validates :user_id, :presence => true
  validates :description, :presence => true
  default_scope :order => 'gnibs.created_at DESC'

  has_many :likearticles, :foreign_key => "article_id"
  has_many :notifications, :foreign_key => "article_id"
  def self.from_users_followed_by(user)
    ids = "SELECT followed_id from relationships WHERE follower_id = :user_id"
    where("user_id IN (#{ids})",:user_id => user)
  end

end
