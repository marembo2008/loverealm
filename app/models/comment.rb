class Comment < ActiveRecord::Base
  attr_accessor :user_id, :description, :reply_to_id, :article_id

#has_many :replies, :foreign_key => "reply_to_id", :class_name => "Comment"

end
