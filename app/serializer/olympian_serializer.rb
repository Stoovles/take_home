class OlympianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name,
             :age,
             :team,
             :sport

 attribute :total_medals_won do |object|
   object.total_medals_won
 end


end
