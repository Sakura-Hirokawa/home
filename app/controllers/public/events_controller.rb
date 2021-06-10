class Public::EventsController < ApplicationController
  before_action :set_event, only:[:show, :edit, :update, :destroy]
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end
  
  def index
    @events = Event.where(user_id: current_user.id)
  end
  
  def show
  end
  
  def edit
    unless @event.user == current_user
      redirect_to root_path
    end
  end
  
  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end
  
  def destroy
    @event.destroy
    redirect_to my_calendar_path
  end
  
  def my_calendar
  end
  
  private
  
  def set_event
    @event = Event.find(params[:id])
  end
  
  def event_params
    params.require(:event).permit(:user_id, :title, :description, :start_at, :end_at)
  end
end