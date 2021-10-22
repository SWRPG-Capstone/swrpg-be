require 'rails_helper'

RSpec.describe Types::EquipmentLogType, type: :request do
  describe 'display EquipmentLogs' do
    describe 'happy path' do
      it 'returns a characters equipment logs' do
        user = User.create(username: "test")
        mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        mace_equipment_logs = mace.equipment_logs.create(credits: 'not sure?', weapons: 'lightsaber', armor: 'cloak', personal_gear: 'none')
        vader_equipment_logs = vader.equipment_logs.create(credits: 'not sure?', weapons: 'lightsaber', armor: 'vader gear', personal_gear: 'helmet')

        query = <<~GQL
                  query {
                    equipmentLog(characterId: #{vader.id}){
                      credits
                      weapons
                      armor
                      personalGear
                    }
                  }
                GQL
      
        post '/graphql', params: {query: query}
        json = JSON.parse(response.body, symbolize_names: true)
        equipment_log = json[:data][:equipmentLog]
        
        expect(equipment_log).to have_key(:credits)
        expect(equipment_log).to have_key(:weapons)
        expect(equipment_log).to have_key(:armor)
        expect(equipment_log).to have_key(:personalGear)

        expect(equipment_log[:credits]).to eq(vader.equipment_logs[0].credits)
        expect(equipment_log[:weapons]).to eq(vader.equipment_logs[0].weapons)
        expect(equipment_log[:armor]).to eq(vader.equipment_logs[0].armor)
        expect(equipment_log[:personalGear]).to eq(vader.equipment_logs[0].personal_gear)
      end
    end
  end
end