class PhotosController < ApplicationController
  #Need to reimplement this
  #before_action :correct_user, only: :destroy

  def index
    @photos = Photo.find_by_album_id(params[:id])
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.album_id = params[:album_id]
    if @photo.save
      redirect_to album_path(id: params[:album_id])
    else
      render 'pages/index'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
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
