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
    find_relationship
    respond_to do |format|
      format.html {}
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
        flash[:notice] = 'Relationship was successfully created.'
        format.html { redirect_to(user_root_path) }
        format.js   {}
        format.json { render json: @relationship, status: :created }
      else
        format.html { render @relationship.errors }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    def edit
      find_relationship
    end
  end
  
  def update
    find_relationship
    
    respond_to do |format|
      if @relationship.update(rel_params)
        flash[:notice] = 'Relationship was successfully updated.'
        format.html { render 'show' }
      else
        flash[:alert] = 'Relationship could not be updated.'
        format.html { render 'edit' }
      end
    end
  end
  
  def destroy
    find_relationship
    
    respond_to do |format|
      if @relationship.destroy
        flash[:notice] = "Successfully deleted relationship."
        format.html { redirect_to(user_root_path) }
        format.js   {}
        format.json { render json: @relationship, status: :deleted }
      else
        flash[:alert] = "Relationship could not be deleted."
        format.html { render json: @relationship.errors, status: :unprocessable_entity }
        format.js   {}
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def get_relationships
      @relationships = Relationship.where(:user_id => current_user[:id])
    end
    
    def find_relationship
      @relationship = Relationship.find(params[:id])
      session[:relationship_id] = @relationship.id
    end
    
    def rel_params
      params.require(:relationship).permit(:title,:name,:description)
    end
  
end
