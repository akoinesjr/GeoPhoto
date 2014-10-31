class AlbumsController < ApplicationController
  def index
    @albums=User.find(params[:user_id]).albums
  end

  def new
    @album = Album.new
  end

  def create
    @album = current_user.albums.build(album_params)
    if @album.save
      redirect_to user_albums_path(user_id: params[:user_id])
    else
      render 'new'
    end
  end

  def show
    @album = Album.find(params[:id])
    @photo = Photo.new
  end

  def edit
    @user = User.find(params[:user_id])
    @album = Album.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @album = Album.find(params[:id])
    @album.update(album_params)

    redirect_to user_album_path
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to user_path(id: current_user)
  end

  private

  def album_params
    params.require(:album).permit(:title, :user_id)
  end

end
