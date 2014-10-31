class PhotosController < ApplicationController
  before_action :correct_user, only: :destroy

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
