class PagesController < ApplicationController
  def index
  	if session[:id] !=nil

  	@user = User.find(session[:id])
  end
end
end