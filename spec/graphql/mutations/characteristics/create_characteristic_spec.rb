require 'rails_helper'

RSpec.describe 'Create Characteristic', type: :request do
  before :each do
    @user = User.create(username: Faker::Name.name, password: 'Test_1234!', password_confirmation: 'Test_1234!')
    @character = @user.characters.create(name: Faker::Name.name, species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
    @query =
    <<~GQL
        mutation {
          createCharacteristic(input: {
            agility: 2
            brawn: 2
            characterId: #{@character.id}
            charPresence: 2
            cunning: 2
            intellect: 2
            willpower: 2
            }) {
            agility
            brawn
            characterId
            charPresence
            cunning
            id
            intellect
            willpower
          }
        }
     GQL
  end

  describe 'Happy Path' do
    it 'creates characteristic' do
      expect(Characteristic.count).to eq(0)
      post '/graphql', params: { query: @query }
      expect(Characteristic.count).to eq(1)
    end

    it 'returns characteristic' do
      post '/graphql', params: { query: @query }
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:createCharacteristic]

      expect(data[:agility]).to eq(2)
      expect(data[:brawn]).to eq(2)
      expect(data[:characterId]).to eq(@character.id)
      expect(data[:charPresence]).to eq(2)
      expect(data[:cunning]).to eq(2)
      expect(data[:intellect]).to eq(2)
      expect(data[:willpower]).to eq(2)
    end
  end

  describe 'Sad Path' do
    it "returns error when float given for agility attribute" do
      @query =
      <<~GQL
          mutation {
            createCharacteristic(input: {
              agility: 2.06
              brawn: 2
              characterId: #{@character.id}
              charPresence: 2
              cunning: 2
              intellect: 2
              willpower: 2
              }) {
              agility
              brawn
              characterId
              charPresence
              cunning
              id
              intellect
              willpower
            }
          }
       GQL

       post '/graphql', params: { query: @query }
       json = JSON.parse(response.body, symbolize_names: true)
       error = json[:errors][0][:message]

       expect(error).to eq("Argument 'agility' on InputObject 'CreateCharacteristicInput' has an invalid value (2.06). Expected type 'Int!'.")
    end

    it "returns error when given nothing for agility attribute" do
      @query =
      <<~GQL
          mutation {
            createCharacteristic(input: {
              agility: "#{}"
              brawn: 2
              characterId: #{@character.id}
              charPresence: 2
              cunning: 2
              intellect: 2
              willpower: 2
              }) {
              agility
              brawn
              characterId
              charPresence
              cunning
              id
              intellect
              willpower
            }
          }
       GQL

       post '/graphql', params: { query: @query }
       json = JSON.parse(response.body, symbolize_names: true)
       error = json[:errors][0][:message]

       expect(error).to eq("Argument 'agility' on InputObject 'CreateCharacteristicInput' has an invalid value (\"\"). Expected type 'Int!'.")
    end

    it "returns error when given boolean for agility attribute" do
      @query =
      <<~GQL
          mutation {
            createCharacteristic(input: {
              agility: true
              brawn: 2
              characterId: #{@character.id}
              charPresence: 2
              cunning: 2
              intellect: 2
              willpower: 2
              }) {
              agility
              brawn
              characterId
              charPresence
              cunning
              id
              intellect
              willpower
            }
          }
       GQL

       post '/graphql', params: { query: @query }
       json = JSON.parse(response.body, symbolize_names: true)
       error = json[:errors][0][:message]

       expect(error).to eq("Argument 'agility' on InputObject 'CreateCharacteristicInput' has an invalid value (true). Expected type 'Int!'.")
    end
  end
end
