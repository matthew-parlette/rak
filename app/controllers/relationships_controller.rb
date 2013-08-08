class RelationshipsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_relationships
  
  def index
    respond_to do |format|
      format.html { render json: @relationships }
      format.js   {}
      format.json { render json: @relationships }
    end
  end
  
  def show
    respond_to do |format|
      format.html { render json: Relationship.find(params[:id]) }
      format.js   {}
      format.json { render json: Relationship.find(params[:id]) }
    end
  end
  
  private
    def get_relationships
      @relationships = Relationship.where(:user_id => current_user)
    end
    
    
  
end
