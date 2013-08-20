class IdeasController < ApplicationController
  before_filter :get_idea, :only => [:show,:edit,:update,:destroy]
  before_filter :get_parent_relationship, :only => [:show]
  
  def index
    @ideas = Idea.all
  end

  def show
  end

  def new
    @idea = Idea.new
  end
  
  def create
    @idea = Idea.new(idea_params)
    
    respond_to do |format|
      if @idea.save
        flash[:notice] = 'Idea was successfully created.'
        format.html { redirect_to(idea_path(@idea)) }
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
        format.html { render 'show' }
      else
        flash[:alert] = 'Idea could not be updated.'
        format.html { render 'edit' }
      end
    end
  end
  
  def destroy
  end
  
  private
    def get_idea
      @idea = Idea.find(params[:id])
    end
    
    def get_parent_relationship
      if @idea.relationship_id
        @relationship = Relationship.find(@idea.relationship_id)
      end
    end
    
    def idea_params
      params.require(:idea).permit(:title,:description,:relationship_id)
      #params.require(:idea).require(:relationship_id)
    end
end
