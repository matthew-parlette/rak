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
  
  def new
    @relationship = Relationship.new
  end
  
  def create
    @relationship = Relationship.new(rel_params)
    @relationship.user = current_user
    
    respond_to do |format|
      if @relationship.save
        format.html { render json: @relationship, notice: 'Task was successfully created.' }
        format.js   {}
        format.json { render json: @relationship, status: :created, location: @task }
      else
        format.html { render json: @relationship.errors, status: :unprocessable_entity }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def get_relationships
      @relationships = Relationship.where(:user_id => current_user[:id])
    end
    
    def rel_params
      params.require(:relationship).permit(:title,:name,:description)
    end
  
end
