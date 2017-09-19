module Api
  #
  class PostsController < ApiController
    def index
      @posts = Post.all
      respond_with @posts
    end
  end
end
