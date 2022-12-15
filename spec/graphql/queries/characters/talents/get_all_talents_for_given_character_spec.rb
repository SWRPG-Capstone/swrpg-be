require 'rails_helper'

RSpec.describe Types::TalentType, type: :request do
  describe 'display talents' do
    describe 'happy path' do
      it 'returns a characters talents' do
        user = User.create(username: "test", password: 'Test_1234!', password_confirmation: 'Test_1234!')
        mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        mace_talents = mace.talents.create(name: 'force', page_number: 1, ability_summary: 'a talent Jedi have')
        vader_talents = vader.talents.create(name: 'force', page_number: 1, ability_summary: 'a talent Jedi have')

        query = <<~GQL
                  query {
                    talent(characterId: #{vader.id}){
                      name
                      pageNumber
                      abilitySummary
                    }
                  }
                GQL
        
        post '/graphql', params: {query: query}
        json = JSON.parse(response.body, symbolize_names: true)
        talent = json[:data][:talent]
       
        expect(talent).to have_key(:name)
        expect(talent).to have_key(:pageNumber)
        expect(talent).to have_key(:abilitySummary)

        expect(talent[:name]).to be_a(String)
        expect(talent[:pageNumber]).to be_an(Integer)
        expect(talent[:abilitySummary]).to be_a(String)

        expect(talent[:name]).to eq(vader.talents[0].name)
        expect(talent[:pageNumber]).to eq(vader.talents[0].page_number)
        expect(talent[:abilitySummary]).to eq(vader.talents[0].ability_summary)
      end 
    end
  end
end