class Likearticle < ActiveRecord::Base

  attr_accessor :article_id, :user_id, :count
  belongs_to :user, :class_name => "User"
  belongs_to :post, :class_name => "Post"

  validates :article_id, :presence => true
  validates :user_id, :presence => true

end
