require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display character' do
    it 'can return a single character by the id' do
      user = User.create(username: "test")
      mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
      vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
      query = <<~GQL 
                query {
                  character(id: #{mace.id}){
                    id
                    name
                    species
                    specialization
                    career 
                    age
                    height
                    build
                    hair
                    eyes
                  } 
                }
              GQL

      result = SwrpgBeSchema.execute(query)
      
      expect(result['data']['character']).to have_key('id')
      expect(result['data']['character']).to have_key('name')
      expect(result['data']['character']).to have_key('species')
      expect(result['data']['character']).to have_key('specialization')
      expect(result['data']['character']).to have_key('career')
      expect(result['data']['character']).to have_key('age')
      expect(result['data']['character']).to have_key('height')
      expect(result['data']['character']).to have_key('build')
      expect(result['data']['character']).to have_key('hair')
      expect(result['data']['character']).to have_key('eyes')
      expect(result['data']['character']['name']).to eq(mace.name)
      expect(result['data']['character']['name']).to_not eq(vader.name)
    end
  end
end