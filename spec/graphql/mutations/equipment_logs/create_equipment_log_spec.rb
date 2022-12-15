require 'rails_helper'

RSpec.describe 'CreateWeapon', type: :request do
  describe '#resolve' do
    describe 'happy path' do
      before :each do
        @user = User.create(username: 'Roald',
                            password: 'Test_1234!',
                            password_confirmation: 'Test_1234!')

        @character = @user.characters.create(
          name: 'Lou',
          species: 'Polar Bear',
          specialization: 'Ice Hockey',
          career: 'Coke Spokesperson',
          age: 44,
          height: '7ft, 3in',
          build: 'RIIIIIPPPPPED',
          hair: 'More like fur',
          eyes: 'hazel'
        )
        @query = <<~GQL
          mutation {
            createEquipmentLog(
              input: {
                characterId: #{@character.id}
                credits: "1423"
                armor: "Ice Gauntlet"
                personalGear: "Snow Shoes"
              }
            ) {
              characterId
              credits
              armor
              personalGear
            }
          }
        GQL
      end

      it 'creates equipment log' do
        expect(EquipmentLog.count).to eq(0)
        post '/graphql', params: { query: @query }
        expect(EquipmentLog.count).to eq(1)
      end

      it 'returns equipment_log' do
        post '/graphql', params: { query: @query }
        json = JSON.parse(response.body, symbolize_names: true)
        equipment_log = json[:data][:createEquipmentLog]

        expect(equipment_log[:credits]).to eq('1423')
        expect(equipment_log[:armor]).to eq('Ice Gauntlet')
        expect(equipment_log[:personalGear]).to eq('Snow Shoes')
      end
    end

    describe 'sad path' do
        before :each do
        @user = User.create(username: 'Roald',
                            password: 'Test_1234!',
                            password_confirmation: 'Test_1234!')

        @character = @user.characters.create(
          name: 'Lou',
          species: 'Polar Bear',
          specialization: 'Ice Hockey',
          career: 'Coke Spokesperson',
          age: 44,
          height: '7ft, 3in',
          build: 'RIIIIIPPPPPED',
          hair: 'More like fur',
          eyes: 'hazel'
        )

        @query = <<~GQL
          mutation {
            createEquipmentLog(
              input: {
                characterId: 1
                armor: "Ice Gauntlet"
                personalGear: "Snow Shoes"
              }
            ) {
              armor
              personalGear
            }
          }
        GQL
      end

      it 'throws error if missing required params' do
        error_message = "Argument 'credits' on InputObject 'CreateEquipmentLogInput' is required. Expected type String!"
        post '/graphql', params: { query: @query }
        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:errors][0][:message]).to eq(error_message)
      end
    end
  end
end