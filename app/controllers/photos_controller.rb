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
    @album = Album.find(@photo.album)
  end

  def update     
    @photo = Photo.find(params[:id])
    puts @photo

    if @photo.update_attributes(photo_params)
      redirect_to album_photo_path
    else
      puts "Failed to update!"
    end
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
    redirect_to album_photos_path(@photo.album_id)
  end

  private

    def photo_params
      params.require(:photo).permit(:title, :image, :longitude, :latitude)
    end

    def correct_user
      @photo=current_user.photos.find_by(id: params[:id])
    end
end
