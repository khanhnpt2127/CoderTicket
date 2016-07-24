class EventsController < ApplicationController

  def index
    @events = Event.all
    @events = Event.where(published: true)
  end

  def new
    @event = Event.new
    @categories = Category.all
    @venues = Venue.all
    @regions = Region.all
  end
  
  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new (event_params)
    
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
    @event.save
    redirect_to @event
    else
      raise "Cant"
    end
  end

  def update_published
  @event = Event.find(params[:id])
    @event.update_attributes(published: true)
    redirect_to @event
  else
    render edit
  end

  private
  def event_params
    params.require(:event).permit(:name,:extended_html_description,:venue_id,:category_id,:starts_at,:ends_at)
  end
end
