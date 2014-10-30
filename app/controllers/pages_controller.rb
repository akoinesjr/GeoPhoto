class PagesController < ApplicationController
  def index
    @album = current_user.albums.build if logged_in?
  end
end
