class Api::V1::EventsController < ApplicationController

  def index
    event_data = []
    #this should be ported to a serializer
    #if database was setup better would not
    #have to revert to using ruby to iterate (inefficient)
    sports = Olympian.pluck(:sport).uniq
    sports.map do |sport|
      events = Olympian.where(sport: sport).pluck(:event).uniq
      event_data.push({
        "sport": sport,
        "events": events
      })
    end
    render json: event_data
  end

end
