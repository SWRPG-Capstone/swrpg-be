require 'rails_helper'

RSpec.describe Types::ObligationType, type: :request do
  describe 'display obligations' do
    describe 'happy path' do
      it 'returns a characters obligations' do
        user = User.create(username: "test", password: 'Test_1234!', password_confirmation: 'Test_1234!')
        mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        mace_obligations = mace.obligations.create(ob_type: 'dutybound', magnitude: 10)
        vader_obligations = vader.obligations.create(ob_type: 'betrayal', magnitude: 10)

        query = <<~GQL
                  query {
                    obligation(characterId: #{vader.id}){
                      obType
                      magnitude
                    }
                  }
                GQL
        
        post '/graphql', params: {query: query}
        json = JSON.parse(response.body, symbolize_names: true)
        obligation = json[:data][:obligation]
       
        expect(obligation).to have_key(:obType)
        expect(obligation).to have_key(:magnitude)

        expect(obligation[:obType]).to be_a(String)
        expect(obligation[:magnitude]).to be_an(Integer)
        
        expect(obligation[:obType]).to eq(vader.obligations[0].ob_type.to_s)
        expect(obligation[:magnitude]).to eq(vader.obligations[0].magnitude)
      end 
    end
  end
end