require 'rails_helper'

RSpec.describe Types::CharacteristicType, type: :request do
  describe 'display characteristics' do
    it 'returns a characters characteristics' do
      user = User.create(username: "test")
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
    end
  end
end
