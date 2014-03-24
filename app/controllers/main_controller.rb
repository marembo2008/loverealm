class MainController < ApplicationController
  def home

  end
  def signin
@user = User.new
  end

 def user_details
@user = current_user
@status_update = StatusUpdate.new
@article = Post.new
end

end
