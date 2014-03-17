class PostsController < ApplicationController

def trending

end

def show

end

def new
@article = Post.new
end

def create
@article = current_user.posts.build(article_params)
if @article.save
puts "article posted"
else
puts "article NOT saved"
end
redirect_to "/"
end

def destroy
end

def article_params
  params.require(:post).permit(:title,:subtitle,:content)
end

end
