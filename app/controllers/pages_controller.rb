class PagesController < ApplicationController
  def index
    @photo = current_user.photos.build if logged_in?
  end
end
