require 'rails_helper'

RSpec.describe Types::CriticalInjuryType, type: :request do
  describe 'display critical injuries' do
    describe 'happy path' do
      it 'returns a characters critical injuries' do
        user = User.create(username: "test")
        mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        mace_critical_injuries = mace.critical_injuries.create(severity: 3, result: 'stabbed')
        vader_critical_injuries = vader.critical_injuries.create(severity: 1, result: 'punched')

        query = <<~GQL
                  query {
                    criticalInjury(characterId: #{vader.id}){
                      severity
                      result
                    }
                  }
                GQL
      
        post '/graphql', params: {query: query}
        json = JSON.parse(response.body, symbolize_names: true)
        critical_injury = json[:data][:criticalInjury]
        
        expect(critical_injury).to have_key(:severity)
        expect(critical_injury).to have_key(:result)

        expect(critical_injury[:severity]).to eq(vader.critical_injuries[0].severity)
        expect(critical_injury[:result]).to eq(vader.critical_injuries[0].result)
      end
    end
  end
end