module Api
  #
  class TextPostsController < ApiController
    def index
      @text_posts = TextPost.all
      respond_with @text_posts
    end

    def create
      @text_post = @api_user.text_posts.create(text_post_params)
      respond_with @text_post
    end

    private

    def text_post_params
      params.require(:text_post).permit(:title, :body)
    end
  end
end
