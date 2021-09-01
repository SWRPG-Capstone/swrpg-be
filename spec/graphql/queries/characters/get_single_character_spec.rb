require 'rails_helper'

RSpec.describe Types::CharacterType, type: :request do
  describe 'display character' do
    it 'can return a single character by the id' do
      user = User.create(username: "test")
      mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
      vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
      query = <<~GQL 
                query {
                  character(id: #{mace.id}){
                    age 
                    build
                    career 
                    eyes 
                    hair
                    height 
                    id 
                    name
                    specialization
                    species
                  } 
                }
              GQL

      post '/graphql', params: { query: query }
      json = JSON.parse(response.body, symbolize_names: true)
      character = json[:data][:character]
      
      expect(character).to have_key(:id)
      expect(character).to have_key(:name)
      expect(character).to have_key(:species)
      expect(character).to have_key(:specialization)
      expect(character).to have_key(:career)
      expect(character).to have_key(:age)
      expect(character).to have_key(:height)
      expect(character).to have_key(:build)
      expect(character).to have_key(:hair)
      expect(character).to have_key(:eyes)
      expect(character[:name]).to eq(mace.name)
      expect(character[:name]).to_not eq(vader.name)
    end
  end
end