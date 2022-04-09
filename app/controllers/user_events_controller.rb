class UserEventsController < ApplicationController
  before_action :authenticate_user!

  def update
    @event = Event.find(params[:id])
    current_user.attended_events << @event
  end

  def destroy
    @event = Event.find(params[:id])
    current_user.attended_events.destroy(@event)
  end
end
