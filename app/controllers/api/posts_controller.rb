module Api
  #
  class PostsController < ApiController
    respond_to :json
    def index
      @posts = Post.all
      respond_with @posts
    end
  end
end
