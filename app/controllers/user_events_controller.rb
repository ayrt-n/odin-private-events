class UserEventsController < ApplicationController
  before_action :authenticate_user!

  def update
    @event = Event.find(params[:id])
    current_user.attended_events << @event unless current_user.attended_events.include?(@event)

    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:id])
    current_user.attended_events.destroy(@event)

    redirect_to @event
  end
end
