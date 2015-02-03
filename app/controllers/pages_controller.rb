class PagesController < ApplicationController
  def index
    @album = current_user.albums.build if logged_in?
  end

  def welcome
  	if logged_in?
  		redirect_to pages_path
  	end
  	@skip_header = true
  end
end
