require 'rails_helper'

describe 'Olympian age param API' do
  it 'returns youngest olympian' do
      Olympian.create(name: "Andreea Aanei", sex: "F", age: 22, height: 170, weight: 125, team: "Romania", games: "2016 Summer", sport: "Weightlifting", event: "Weightlifting Women's Super-Heavyweight", medal: "NA")
      Olympian.create(name: "Nstor Abad Sanjun", sex: "M", age: 23, height: 167, weight: 64, team: "Spain", games: "2016 Summer", sport: "Gymnastics", event: "Gymnastics Men's Individual All-Around", medal: "NA")

    get '/api/v1/olympian?age=youngest'

    expect(response).to be_successful

    olympian = JSON.parse(response.body)

    expect(olympian["data"][0]["attributes"]["name"]).to eq("Andreea Aanei")
  end

  it 'returns oldest olympian' do
      Olympian.create(name: "Andreea Aanei", sex: "F", age: 22, height: 170, weight: 125, team: "Romania", games: "2016 Summer", sport: "Weightlifting", event: "Weightlifting Women's Super-Heavyweight", medal: "NA")
      Olympian.create(name: "Nstor Abad Sanjun", sex: "M", age: 23, height: 167, weight: 64, team: "Spain", games: "2016 Summer", sport: "Gymnastics", event: "Gymnastics Men's Individual All-Around", medal: "NA")

    get '/api/v1/olympian?age=oldest'

    expect(response).to be_successful

    olympian = JSON.parse(response.body)

    expect(olympian["data"][0]["attributes"]["name"]).to eq("Nstor Abad Sanjun")
  end


end
