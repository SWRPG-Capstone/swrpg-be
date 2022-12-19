require 'rails_helper'

RSpec.describe Types::CharacteristicType, type: :request do
  describe 'display characteristics' do
    describe 'happy path' do
      it 'returns a characters characteristics' do
        user = User.create(username: "test", password: 'Test_1234!', password_confirmation: 'Test_1234!')
        mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        mace_characteristics = mace.characteristics.create(agility: 1, brawn: 2, char_presence: 3, cunning: 4, intellect: 5, willpower: 1)
        vader_characteristics = vader.characteristics.create(agility: 5, brawn: 4, char_presence: 3, cunning: 2, intellect: 1, willpower: 5)

        query = <<~GQL
                  query {
                    characteristic(characterId: #{vader.id}){
                      agility
                      brawn
                      charPresence
                      cunning
                      id
                      intellect
                      willpower
                    }
                  }
                GQL

        post '/graphql', params: {query: query}
        json = JSON.parse(response.body, symbolize_names: true)
        characteristic = json[:data][:characteristic]

        expect(characteristic).to have_key(:id)
        expect(characteristic).to have_key(:agility)
        expect(characteristic).to have_key(:brawn)
        expect(characteristic).to have_key(:charPresence)
        expect(characteristic).to have_key(:cunning)
        expect(characteristic).to have_key(:intellect)
        expect(characteristic).to have_key(:willpower)

        expect(characteristic[:id]).to be_a(String)
        expect(characteristic[:agility]).to be_an(Integer)
        expect(characteristic[:brawn]).to be_an(Integer)
        expect(characteristic[:charPresence]).to be_an(Integer)
        expect(characteristic[:cunning]).to be_an(Integer)
        expect(characteristic[:intellect]).to be_an(Integer)
        expect(characteristic[:willpower]).to be_an(Integer)

        expect(characteristic[:id]).to eq(vader.characteristics[0].id.to_s)
        expect(characteristic[:agility]).to eq(vader.characteristics[0].agility)
        expect(characteristic[:brawn]).to eq(vader.characteristics[0].brawn)
        expect(characteristic[:charPresence]).to eq(vader.characteristics[0].char_presence)
        expect(characteristic[:cunning]).to eq(vader.characteristics[0].cunning)
        expect(characteristic[:intellect]).to eq(vader.characteristics[0].intellect)
        expect(characteristic[:willpower]).to eq(vader.characteristics[0].willpower)

        expect(characteristic[:id]).to_not eq(mace.characteristics[0].id.to_s)
      end

      describe 'sad path' do
        it 'if no character id provided, returns error' do
          user = User.create(username: "test", password: 'Test_1234!', password_confirmation: 'Test_1234!')
          vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
          vader_characteristics = vader.characteristics.create(agility: 5, brawn: 4, char_presence: 3, cunning: 2, intellect: 1, willpower: 5)

          query = <<~GQL
                    query {
                      characteristic(characterId: "#{}"){
                        agility
                        brawn
                        charPresence
                        cunning
                        id
                        intellect
                        willpower
                      }
                    }
                  GQL

          post '/graphql', params: { query: @query}
          json = JSON.parse(response.body)
          data = json['errors']
          expect(data[0]['message']).to eq("No query string was present")
        end
      end
    end
  end
end
