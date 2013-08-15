class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if user_signed_in?
      @relationships = Relationship.where(:user_id => current_user[:id])
    end
  end
end
