class PostsController < ApplicationController
  def trending

  end

  def show

  end

  def create
    @article = current_user.posts.build(params[:article])
    puts "article posted"
  end

  def destroy
  end

end
