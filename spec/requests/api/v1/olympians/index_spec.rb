require 'rails_helper'

describe 'Olympians API' do
  it 'sends a list of olympians' do
      Olympian.create(name: "Andreea Aanei", sex: "F", age: 22, height: 170, weight: 125, team: "Romania", games: "2016 Summer", sport: "Weightlifting", event: "Weightlifting Women's Super-Heavyweight", medal: "NA")
      Olympian.create(name: "Nstor Abad Sanjun", sex: "M", age: 23, height: 167, weight: 64, team: "Spain", games: "2016 Summer", sport: "Gymnastics", event: "Gymnastics Men's Individual All-Around", medal: "NA")

    get '/api/v1/olympians'

    expect(response).to be_successful

    olympians = JSON.parse(response.body)

    expect(olympians["data"].count).to eq(2)
  end

  it 'presents accurate attributes' do
    Olympian.create(name: "Andreea Aanei", sex: "F", age: 22, height: 170, weight: 125, team: "Romania", games: "2016 Summer", sport: "Weightlifting", event: "Weightlifting Women's Super-Heavyweight", medal: "NA")
    Olympian.create(name: "Nstor Abad Sanjun", sex: "M", age: 23, height: 167, weight: 64, team: "Spain", games: "2016 Summer", sport: "Gymnastics", event: "Gymnastics Men's Individual All-Around", medal: "NA")
    get '/api/v1/olympians'

    expect(response).to be_successful

    olympian = JSON.parse(response.body)['data'][0]
    expect(olympian["attributes"].key?("name")).to eq(true)
    expect(olympian["attributes"].key?("age")).to eq(true)
    expect(olympian["attributes"].key?("team")).to eq(true)
    expect(olympian["attributes"].key?("sport")).to eq(true)
    expect(olympian["attributes"].key?("total_medals_won")).to eq(true)
  end


end
