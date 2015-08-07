class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @album = Album.find(params[:album_id])
    @user = User.find(params[:id])
  end


  def show
    @user = User.find(params[:id])
    @albums=@user.albums
    @photos = []
    @albums.each do |album|
      album.photos.each do |photo|
        @photos.push(photo)
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to '/'
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
