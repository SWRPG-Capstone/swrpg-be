require 'rails_helper'

RSpec.describe Types::CharacterType, type: :request do
  describe 'display character' do
    describe 'happy path' do
      it 'can return a single character by the id' do
        user = User.create(username: "test", password: 'Test_1234!', password_confirmation: 'Test_1234!')
        mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        vader = user.characters.create(name: "Darth Vader", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
        query = <<~GQL
                  query {
                    character(id: #{mace.id}){
                      age
                      build
                      career
                      eyes
                      hair
                      height
                      id
                      name
                      specialization
                      species
                    }
                  }
                GQL

        post '/graphql', params: { query: query }
        json = JSON.parse(response.body, symbolize_names: true)
        character = json[:data][:character]

        expect(character).to have_key(:id)
        expect(character).to have_key(:name)
        expect(character).to have_key(:species)
        expect(character).to have_key(:specialization)
        expect(character).to have_key(:career)
        expect(character).to have_key(:age)
        expect(character).to have_key(:height)
        expect(character).to have_key(:build)
        expect(character).to have_key(:hair)
        expect(character).to have_key(:eyes)

        expect(character[:age]).to be_an(Integer)
        character.delete(:age)
        character.values.each {|value| expect(value).to be_a(String)}

        expect(character[:id]).to eq(mace.id.to_s)
        expect(character[:name]).to eq(mace.name)
        expect(character[:species]).to eq(mace.species)
        expect(character[:specialization]).to eq(mace.specialization)
        expect(character[:career]).to eq(mace.career)
        expect(character[:height]).to eq(mace.height)
        expect(character[:build]).to eq(mace.build)
        expect(character[:hair]).to eq(mace.hair)
        expect(character[:eyes]).to eq(mace.eyes)

        expect(character[:id]).to_not eq(vader.id)
      end

      describe 'sad path' do
        it 'if no character id provided, returns error' do
          user = User.create(username: "test", password: 'Test_1234!', password_confirmation: 'Test_1234!')
          mace = user.characters.create(name: "Mace Windu", species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
          query = <<~GQL
                    query {
                      character(id: "#{}"){
                        age
                        build
                        career
                        eyes
                        hair
                        height
                        id
                        name
                        specialization
                        species
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
