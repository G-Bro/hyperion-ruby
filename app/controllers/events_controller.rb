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
      :path_part_1 => nil,
      :path_part_2 => nil,
      :path_part_3 => nil 
    }

    # fill the pathPart properties with available data
    path_parts = uri.path.split('/').reject(&:empty?)

    i = 0
    while i < [path_parts.length, 3].min do
      parts["path_part_#{i + 1}"] = path_parts[i]
      i += 1
    end
    parts
  end

  def query
    events_query = Event
    events_query = events_query.where(ref: params[:ref]) if params[:ref].present?
    events_query = events_query.where(name: params[:event]) if params[:event].present?
    # events_query = events_query.joins(:url).where(:url => {:host => 'teemill.com' })

    if params[:filter].present?
      params[:filter].each do |filter|
        events_query = helpers.filter_query(events_query, filter)
      end
    end

    events_query = events_query.includes(:url)

    render_query(events_query)
  end

  def render_query(events_query)
    if !params[:format].present? || params[:format] == 'json'
      render json: events_query.limit(params[:limit] || 100).to_json(
        :include => {
          :url => {
            :except => [:created_at, :updated_at, :id, :event_id]
          }
        },
        :except => [:id]
      ) 
    end
    render xml: events_query if params[:format] == 'xml'
    render json: events_query.exists? if params[:format] == 'bool'
    render json: events_query.count if params[:format] == 'count'
  end
end
