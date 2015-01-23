class PagesController < ApplicationController
  def index
    @album = current_user.albums.build if logged_in?
  end

  def welcome
  	@skip_header = true
  end
end
