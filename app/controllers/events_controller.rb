class EventsController < ApplicationController
  # this is the access point handler
  def track
    event = Event.new(track_validated_params)
    event.save

    # render json: e
    url = Url.new(uri_parts)
    url.event = event
    url.save
    
    render json: event
  end

  # perform parameter validation
  def track_validated_params
    {
      :name => params.require(:name),
      :ref => params.require(:ref)
    }
  end

  def uri_parts
    require 'uri'

    uri = URI.parse(params.require(:referer))
    
    parts = {
      :host => uri.host,
      :port => uri.port,
      :path => uri.path,
      :query => uri.query,
      :pathPart1 => nil,
      :pathPart2 => nil,
      :pathPart3 => nil 
    }

    # fill the pathPart properties with available data
    path_parts = uri.path.split('/').reject(&:empty?)

    i = 0
    while i < [path_parts.length, 3].min do
      parts["pathPart#{i + 1}"] = path_parts[i]
      i += 1
    end
    parts
  end
end
