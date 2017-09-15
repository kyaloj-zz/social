#
class ImagePostsController < ApplicationController
  def edit
    @image_post = current_user.image_posts.find(params[:id])
  end

  def update
    @image_post = current_user.image_posts.find(params[:id])
    if @image_post.update(image_post_params)
      redirect_to post_path(@image_post), notice: 'Post updated!'
    else
      render :edit, alert: 'Error updating post.'
    end
  end
end
