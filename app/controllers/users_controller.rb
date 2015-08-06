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

private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
