require 'rails_helper'

describe 'Events API' do
  it 'sends a list of Events' do
      Olympian.create(name: "Andreea Aanei", sex: "F", age: 22, height: 170, weight: 125, team: "Romania", games: "2016 Summer", sport: "Weightlifting", event: "Weightlifting Women's Super-Heavyweight", medal: "NA")
      Olympian.create(name: "Nstor Abad Sanjun", sex: "M", age: 23, height: 167, weight: 64, team: "Spain", games: "2016 Summer", sport: "Gymnastics", event: "Gymnastics Men's Individual All-Around", medal: "NA")

    get '/api/v1/events'

    expect(response).to be_successful

    events = JSON.parse(response.body)

    expect(events.count).to eq(2)
  end

  it 'presents accurate attributes' do
    Olympian.create(name: "Andreea Aanei", sex: "F", age: 22, height: 170, weight: 125, team: "Romania", games: "2016 Summer", sport: "Weightlifting", event: "Weightlifting Women's Super-Heavyweight", medal: "NA")
    Olympian.create(name: "Nstor Abad Sanjun", sex: "M", age: 23, height: 167, weight: 64, team: "Spain", games: "2016 Summer", sport: "Gymnastics", event: "Gymnastics Men's Individual All-Around", medal: "NA")
    get '/api/v1/events'

    expect(response).to be_successful

    events = JSON.parse(response.body)
    expect(events[0].key?("sport")).to eq(true)
    expect(events[0].key?("events")).to eq(true)
  end


end
