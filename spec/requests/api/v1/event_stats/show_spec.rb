require 'rails_helper'

describe 'Event Stats API' do
  it 'sends event stats' do
      Olympian.create(name: "Andreea Aanei", sex: "F", age: 22, height: 170, weight: 125, team: "Romania", games: "2016 Summer", sport: "Weightlifting", event: "Weightlifting Women's Super-Heavyweight", medal: "NA")
      Olympian.create(name: "Nstor Abad Sanjun", sex: "M", age: 23, height: 167, weight: 64, team: "Spain", games: "2016 Summer", sport: "Gymnastics", event: "Gymnastics Men's Individual All-Around", medal: "Gold")

    get "/api/v1/event_stats?name=Gymnastics+Men's+Individual+All-Around"

    expect(response).to be_successful

    event_stats = JSON.parse(response.body)

    expect(event_stats["medalists"].count).to eq(1)
  end

  it 'presents accurate attributes' do
    Olympian.create(name: "Andreea Aanei", sex: "F", age: 22, height: 170, weight: 125, team: "Romania", games: "2016 Summer", sport: "Weightlifting", event: "Weightlifting Women's Super-Heavyweight", medal: "NA")
    Olympian.create(name: "Nstor Abad Sanjun", sex: "M", age: 23, height: 167, weight: 64, team: "Spain", games: "2016 Summer", sport: "Gymnastics", event: "Gymnastics Men's Individual All-Around", medal: "Gold")
    get "/api/v1/event_stats?name=Gymnastics+Men's+Individual+All-Around"

    expect(response).to be_successful

    event_stats = JSON.parse(response.body)
    expect(event_stats.key?("event")).to eq(true)
    expect(event_stats.key?("medalists")).to eq(true)
  end


end
