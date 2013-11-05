class WelcomeController < ApplicationController
  before_filter :get_relationships
  
  def index
  end
  
  private
    def get_relationships
      if current_user
        @relationships = Relationship.where(:user_id => current_user[:id])
      end
    end
end
