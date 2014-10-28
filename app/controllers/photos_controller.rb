class PhotosController < ApplicationController
  def index
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to root_url
    else
      render 'pages/index'
    end
  end

  def destroy
  end

  private

    def photo_params
      params.require(:photo).permit(:title)
    end
end
