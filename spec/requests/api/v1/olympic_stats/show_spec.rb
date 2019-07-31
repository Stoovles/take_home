require 'rails_helper'

describe 'Olympian stats API' do
  it 'presents accurate attributes' do
    Olympian.create(name: "Andreea Aanei", sex: "F", age: 22, height: 170, weight: 125, team: "Romania", games: "2016 Summer", sport: "Weightlifting", event: "Weightlifting Women's Super-Heavyweight", medal: "NA")
    Olympian.create(name: "Nstor Abad Sanjun", sex: "M", age: 23, height: 167, weight: 64, team: "Spain", games: "2016 Summer", sport: "Gymnastics", event: "Gymnastics Men's Individual All-Around", medal: "NA")
    get '/api/v1/olympian_stats'

    expect(response).to be_successful

    olympian_stats = JSON.parse(response.body)
    expect(olympian_stats["olympian_stats"].key?("total_competing_olympians")).to eq(true)
    expect(olympian_stats["olympian_stats"].key?("average_age")).to eq(true)
    expect(olympian_stats["olympian_stats"].key?("average_weight")).to eq(true)
    expect(olympian_stats["olympian_stats"]["average_weight"].key?("unit")).to eq(true)
    expect(olympian_stats["olympian_stats"]["average_weight"].key?("male_olympians")).to eq(true)
    expect(olympian_stats["olympian_stats"]["average_weight"].key?("female_olympians")).to eq(true)
  end

end
