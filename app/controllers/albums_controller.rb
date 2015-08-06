class AlbumsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @albums=@user.albums
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    @album.user_id = params[:user_id]

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
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)

    redirect_to album_path
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
