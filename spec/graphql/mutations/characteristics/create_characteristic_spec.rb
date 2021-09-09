require 'rails_helper'

RSpec.describe 'Create Characteristic', type: :request do
  describe 'resolve' do

    describe 'happy path' do
      before :each do
        @user = User.create(username: Faker::Name.name)
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

    describe 'sad path' do
      before :each do
        @user = User.create(username: Faker::Name.name)
        @character = @user.characters.create(name: Faker::Name.name, species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
      end

      it 'if no agility included, returns error' do
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

        expect(Characteristic.count).to eq(0)
        post '/graphql', params: { query: @query }
        expect(Characteristic.count).to eq(0)
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Argument 'agility' on InputObject 'CreateCharacteristicInput' has an invalid value (\"\"). Expected type 'Int!'.")
      end

      it 'if no brawn included, returns error' do
        @query =
        <<~GQL
            mutation {
              createCharacteristic(input: {
                agility: 2
                brawn: "#{}"
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

        expect(Characteristic.count).to eq(0)
        post '/graphql', params: { query: @query }
        expect(Characteristic.count).to eq(0)
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Argument 'brawn' on InputObject 'CreateCharacteristicInput' has an invalid value (\"\"). Expected type 'Int!'.")
      end

      it 'if no charPresence included, returns error' do
        @query =
        <<~GQL
            mutation {
              createCharacteristic(input: {
                agility: 2
                brawn: 2
                characterId: #{@character.id}
                charPresence: "#{}"
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

        expect(Characteristic.count).to eq(0)
        post '/graphql', params: { query: @query }
        expect(Characteristic.count).to eq(0)
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Argument 'charPresence' on InputObject 'CreateCharacteristicInput' has an invalid value (\"\"). Expected type 'Int!'.")
      end

      it 'if no cunning included, returns error' do
        @query =
        <<~GQL
            mutation {
              createCharacteristic(input: {
                agility: 2
                brawn: 2
                characterId: #{@character.id}
                charPresence: 2
                cunning: "#{}"
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

        expect(Characteristic.count).to eq(0)
        post '/graphql', params: { query: @query }
        expect(Characteristic.count).to eq(0)
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Argument 'cunning' on InputObject 'CreateCharacteristicInput' has an invalid value (\"\"). Expected type 'Int!'.")
      end

      it 'if no intellect included, returns error' do
        @query =
        <<~GQL
            mutation {
              createCharacteristic(input: {
                agility: 2
                brawn: 2
                characterId: #{@character.id}
                charPresence: 2
                cunning: 2
                intellect: "#{}"
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

        expect(Characteristic.count).to eq(0)
        post '/graphql', params: { query: @query }
        expect(Characteristic.count).to eq(0)
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Argument 'intellect' on InputObject 'CreateCharacteristicInput' has an invalid value (\"\"). Expected type 'Int!'.")
      end

      it 'if no willpower included, returns error' do
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
                willpower: "#{}"
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

        expect(Characteristic.count).to eq(0)
        post '/graphql', params: { query: @query }
        expect(Characteristic.count).to eq(0)
        json = JSON.parse(response.body)
        data = json['errors']
        expect(data[0]['message']).to eq("Argument 'willpower' on InputObject 'CreateCharacteristicInput' has an invalid value (\"\"). Expected type 'Int!'.")
      end
    end
  end
end
