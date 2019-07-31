class Api::V1::OlympianStatsController < ApplicationController

  def show
    #this should be ported to a serializer
    olympic_stats = {
      "olympian_stats":
      {
        "total_competing_olympians": Olympian.total_olympians,
        "average_age": Olympian.average_age,
        "average_weight":
        {
          "unit": "kg",
          "male_olympians": Olympian.male_average_weight,
          "female_olympians": Olympian.female_average_weight
        }
      }
    }
    render json: olympic_stats
  end

end
