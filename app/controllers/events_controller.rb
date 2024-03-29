class EventsController < ApplicationController
  before_action :set_event, :only => [ :show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to :action => :index
      flash[:notice] = "event was successfully created"
    else
      render :action => :new
    end
  end

  def show
    @page_title = @event.name
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to :action => :show, :id => @event
      flash[:notice] = "event was successfully updated"
    else
      render :action => :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to :action => :index
    flash[:alert] = "event was successfully deleted"
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :logo)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
