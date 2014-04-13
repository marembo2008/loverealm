class PostsController < ApplicationController
  def trending

  end

  def view

  end
  
  def show
    
  end

  def destroy
  end

  def new
    @article = Post.new
  end

  def create
    puts "creating article"
    @article = current_user.posts.build(article_params)
    if @article.save
      puts "article posted"
    else
      puts "article NOT saved"
    end
    redirect_to "/details"
  end

  def article_params
    params.require(:post).permit(:title,:subtitle,:content)
  end

end
