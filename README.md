# README
Ruby Version:
2.4.1p111

Database Management System:
PostgreSQL

Heroku URL: (production)

	https://olympic-challenge.herokuapp.com

Getting Started:  

In terminal run >  

	bundle install (installs all necessary dependencies)  

	rake import:olympians   

	rake db:{create,migrate}

	rails s  (starts server locally)
	
Testing:

In terminal run >

	rspec 

Endpoints:  

	namespace :api do  

		namespace :v1 do  

	get '/olympian', to: 'olympians#show'  

	get '/olympians', to: 'olympians#index'  

	get '/olympian_stats', to: 'olympian_stats#show'  

	get '/events', to: 'events#index'  

	get '/event_stats', to: 'event_stats#show'  

		end
	end

Endpoint Responses: 

	get '/olympians'
	{
	"data": [
	{
	"id": "120",
	"type": "olympian",
	"attributes": {
	"name": "  Gabrielle Marie \"Gabby\" Adcock (White-)",
	"age": 25,
	"team": "Great Britain",
	"sport": "Badminton",
	"total_medals_won": 0
	}
	},
	{...}
	}

get '/olympian?age=youngest'

	{
	"data": [
	{
	"id": "2663",
	"type": "olympian",
	"attributes": {
	"name": "Ana Iulia Dascl",
	"age": 13,
	"team": "Romania",
	"sport": "Swimming",
	"total_medals_won": 0
	}
	}
	]
	}

get '/olympian?age=oldest'

	{
	"data": [
	{
	"id": "1613",
	"type": "olympian",
	"attributes": {
	"name": "Julie Brougham",
	"age": 62,
	"team": "New Zealand",
	"sport": "Equestrianism",
	"total_medals_won": 0
	}
	}
	]
	}

get '/olympian_stats'

	{
	"olympian_stats": {
	"total_competing_olympians": 2850,
	"average_age": "26.2",
	"average_weight": {
	"unit": "kg",
	"male_olympians": "77.0",
	"female_olympians": "60.7"
	}
	}
	}


get '/events'

	[
	{
	"sport": "Weightlifting",
	"events": [
	"Weightlifting Women's Super-Heavyweight",
	"Weightlifting Men's Heavyweight",
	"Weightlifting Men's Middleweight",
	"Weightlifting Men's Middle-Heavyweight",
	"Weightlifting Men's Featherweight",
	"Weightlifting Women's Flyweight",
	"Weightlifting Women's Middleweight",
	"Weightlifting Women's Lightweight",
	"Weightlifting Men's Lightweight",
	"Weightlifting Men's Super-Heavyweight",
	"Weightlifting Men's Light-Heavyweight",
	"Weightlifting Women's Heavyweight",
	"Weightlifting Women's Light-Heavyweight",
	"Weightlifting Men's Bantamweight",
	"Weightlifting Women's Featherweight"
	]
	},
	{...}
	}
	]

get '/event_stats?name=EVENT+NAME'

	{
	"event": "Athletics Men's 5,000 metres",
	"medalists": [
	{
	"id": 2103,
	"name": "Paul Kipkemboi Chelimo",
	"sex": "M",
	"age": 25,
	"height": 175,
	"weight": 57,
	"team": "United States",
	"games": "2016 Summer",
	"sport": "Athletics",
	"event": "Athletics Men's 5,000 metres",
	"medal": "Silver"
	}
	]
	}

  
