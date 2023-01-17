require 'rails_helper'

RSpec.describe Types::MotivationType, type: :request do
  describe 'display motivations' do
    describe 'happy path' do
      it 'returns a characters motivations' do
        user = User.create(username: "test")
        mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        mace_motivations = mace.motivations.create(mo_type: 'power')
        vader_motivations = vader.motivations.create(mo_type: 'freedom')

        query = <<~GQL
                  query {
                    motivation(characterId: #{vader.id}){
                      moType
                    }
                  }
                GQL
      
        post '/graphql', params: {query: query}
        json = JSON.parse(response.body, symbolize_names: true)
        motivation = json[:data][:motivation]
        
        expect(motivation).to have_key(:moType)

        expect(motivation[:moType]).to eq(vader.movtivations[0].mo_type)
      end
    end
  end
end