class PhotosController < ApplicationController
  before_action :correct_user, only: :destroy

  def index
    @photos = Photo.find_by_album_id(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to root_path
    else
      render 'pages/index'
    end
  end

  def destroy
    @photo.destroy
    flash[:success] = "Photo deleted!"
    redirect_to root_url
  end

  private

    def photo_params
      params.require(:photo).permit(:title, :image)
    end

    def correct_user
      @photo=current_user.photos.find_by(id: params[:id])
    end
end
