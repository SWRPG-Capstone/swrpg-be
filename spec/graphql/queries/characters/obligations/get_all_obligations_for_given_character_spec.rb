require 'rails_helper'

RSpec.describe Types::CharacteristicType, type: :request do
  describe 'display characteristics' do
    describe 'happy path' do
      it 'returns a characters characteristics' do
        user = User.create(username: "test")
        mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        mace_characteristics = mace.obligations.create(ob_type: 'dutybound', magnitude: 10)
        vader_characteristics = vader.obligations.create(ob_type: 'betrayal', magnitude: 10)

        query = <<~GQL
                  query {
                    obligations(characterId: #{vader.id}){
                      ob_type
                      magnitude
                    }
                  }
                GQL
        
        
      end 
    end
  end
end 