class Api::V1::EventStatsController < ApplicationController
  before_action :set_event, only: [:show]

  def show
    #this should be ported to a serializer
    event_stats = {
      "event": params[:name],
      "medalists": @medalists
    }
    render json: event_stats
  end

private

  def set_event
    if(params.has_key?(:name))
      @medalists = Olympian.where(event: params[:name]).where.not(medal: "NA")
    end
  end

end



#
# {
#   "event": "Badminton Mixed Doubles",
#   "medalists": [
#       {
#         "name": "Tontowi Ahmad",
#         "team": "Indonesia-1",
#         "age": 29,
#         "medal": "Gold"
#       },
#       {
#         "name": "Chan Peng Soon",
#         "team": "Malaysia",
#         "age": 28,
#         "medal": "Silver"
#       }
#     ]
# }
