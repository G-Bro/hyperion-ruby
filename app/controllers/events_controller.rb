class EventsController < ApplicationController
  def track
    e = Event.new(track_validated_params)
    e.save

    render json: e
  end

  def track_validated_params
    {
      :name => params.require(:name),
      :ref => params.require(:ref)
    }
  end
end
