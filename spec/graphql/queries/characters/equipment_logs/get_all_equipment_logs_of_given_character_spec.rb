require 'rails_helper'

RSpec.describe Types::EquipmentLogType, type: :request do
  describe 'display EquipmentLogs' do
    describe 'happy path' do
      it 'returns a characters equipment logs' do
        user = User.create(username: "test", password: 'Test_1234!', password_confirmation: 'Test_1234!')
        mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        mace_equipment_logs = mace.create_equipment_log(credits: 'not sure?', armor: 'cloak', personal_gear: 'none')
        vader_equipment_logs = vader.create_equipment_log(credits: 'not sure?', armor: 'vader gear', personal_gear: 'helmet')

        query = <<~GQL
                  query {
                    equipmentLog(characterId: #{vader.id}){
                      credits
                      armor
                      personalGear
                    }
                  }
                GQL
      
        post '/graphql', params: {query: query}
        json = JSON.parse(response.body, symbolize_names: true)
        equipment_log = json[:data][:equipmentLog]
        
        expect(equipment_log).to have_key(:credits)
        expect(equipment_log).to have_key(:armor)
        expect(equipment_log).to have_key(:personalGear)

        expect(equipment_log[:credits]).to eq(vader.equipment_log.credits)
        expect(equipment_log[:armor]).to eq(vader.equipment_log.armor)
        expect(equipment_log[:personalGear]).to eq(vader.equipment_log.personal_gear)
      end
    end
  end
end