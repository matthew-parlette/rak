class EventsController < ApplicationController
  before_filter :get_event, :only => [:show,:edit,:update,:destroy]
  before_filter :get_parent_idea, :only => [:show, :create, :new, :destroy]
  before_filter :get_parent_relationship, :only => [:destroy]
  
  def show
    logger.info json: @event
    respond_to do |format|
      format.html {}
      format.json { render json: @event }
    end
  end

  def new
    @event = Event.new
    @event.date = Date.today
    if @idea
      logger.info "idea is valid"
      @event.idea_id = @idea.id
    end
  end
  
  def create
    @event = Event.new(event_params)
    @event.idea_id = @idea.id
    
    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to :back }
      else
        format.html { render 'new' }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @event.update(event_params)
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to :back }
        format.js   { }
        format.json { render json: @event }
      else
        flash[:alert] = 'Event could not be updated.'
        format.html { redirect_to :edit }
        format.json { render json: @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
  end
  
  private
    def get_event
      @event = Event.find(params[:id])
    end
    
    def get_parent_idea
      if params[:idea_id]
        @idea = Idea.find(params[:idea_id])
      elsif params[:event] and params[:event][:idea_id]
        @idea = Idea.find(params[:event][:idea_id])
      elsif @event.idea_id
        @idea = Idea.find(@event.idea_id)
      end
      logger.info "idea is " + @idea.title
    end
    
    def get_parent_relationship
      if @idea.relationship_id
        @relationship = Relationship.find(@idea.relationship_id)
      end
    end
    
    def event_params
      params.require(:event).permit(:title,:description,:date,:reaction,:idea_id)
    end
end
