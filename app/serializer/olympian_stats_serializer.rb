class OlympianStatsSerializer
  include FastJsonapi::ObjectSerializer

  attribute :total_competing_olympians do |object|
    object.olympian_count
  end

  attribute :average_weight do |object|
    object.average_weight
  end

  attribute :average_age do |object|
    object.average_age
  end

# {
#   "olympian_stats": {
#     "total_competing_olympians": 3120
#     "average_weight:" {
#       "unit": "kg",
#       "male_olympians": 75.4,
#       "female_olympians": 70.2
#     }
#     "average_age:" 26.2
#   }
# }


end
