class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if user_signed_in?
      render text: "Signed in as "+current_user[:email]
    end
  end
end
