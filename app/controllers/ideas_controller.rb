class IdeasController < ApplicationController
  before_filter :get_idea, :only => [:show,:edit,:update,:destroy]
  before_filter :get_parent_relationship, :only => [:show]
  before_filter :get_events, :only => [:show]
  
  def index
    @ideas = Idea.all
  end

  def show
    respond_to do |format|
      format.html {}
      format.js   { render :layout => false }
      #json rendering doesn't include the elements that don't exist in the database,
      # so here we have to explicitly include the reaction element.
      format.json { render json: @idea.to_json(:methods => [:reaction]) }
    end
  end

  def new
    @idea = Idea.new
    respond_to do |format|
      format.html {}
    end
  end
  
  def create
    @idea = Idea.new(idea_params)
    
    respond_to do |format|
      if @idea.save
        flash[:notice] = 'Idea was successfully created.'
        format.html { redirect_to :back }
      else
        format.html { render @idea.errors }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        flash[:notice] = 'Idea was successfully updated.'
        format.html { redirect_to :back }
        format.js   { }
      else
        flash[:alert] = 'Idea could not be updated.'
        format.html { render 'edit' }
      end
    end
  rescue ActionController::RedirectBackError
    redirect_to user_root
  end
  
  def destroy
    respond_to do |format|
      if @idea.destroy
        flash[:notice] = "Successfully deleted idea."
        format.html do
          redirect_to :back and return unless request.referer == idea_url(@idea)
          redirect_to user_root_path
        end
        format.js   {}
      else
        flash[:alert] = "Idea could not be deleted."
        format.html { render json: @idea.errors, status: :unprocessable_entity }
        format.js   {}
      end
    end
  rescue ActionController::RedirectBackError
    redirect_to user_root
  end
  
  private
    def get_idea
      @idea = Idea.find(params[:id])
      @idea.reaction = Event.where(:idea_id => @idea.id).average(:reaction)
    end
    
    def get_parent_relationship
      if @idea.relationship_id
        @relationship = Relationship.find(@idea.relationship_id)
      end
    end
    
    def get_events
      @events = Event.where(:idea_id => @idea.id)
    end
    
    def idea_params
      params.require(:idea).permit(:title,:description,:relationship_id)
      #params.require(:idea).require(:relationship_id)
    end
end
